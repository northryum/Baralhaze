// --- obj_opcoes: Evento Step ---
// ==========================================
// 1. INPUTS TECLADO
// ==========================================
var _esq_segurando = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _dir_segurando = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _esq_clique    = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var _dir_clique    = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _mov_h         = _dir_clique - _esq_clique;
var _enter         = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var _esc           = keyboard_check_pressed(vk_escape);

// ==========================================
// 2. INPUTS MOUSE
// ==========================================
var _mouse_click = mouse_check_button_pressed(mb_left);
var _mouse_held  = mouse_check_button(mb_left);
var _mx = mouse_x;
var _my = mouse_y;

var _mouse_moveu = (_mx != mx_prev || _my != my_prev);
mx_prev = _mx;
my_prev = _my;

// ==========================================
// 3. MODO POPUP DE CONFIRMAÇÃO
// ==========================================
if (estado_confirmacao) {
    var _cx = room_width / 2;
    var _cy = room_height / 2;
    
    // Teclado
    if (_mov_h != 0) {
        selecao_confirmacao += _mov_h;
        if (selecao_confirmacao < 0) selecao_confirmacao = 1;
        if (selecao_confirmacao > 1) selecao_confirmacao = 0;
    }
    
    // Mouse Hover nos botões do Popup
    if (_mouse_moveu) {
        if (point_in_rectangle(_mx, _my, _cx - 180, _cy + 10, _cx - 20, _cy + 50)) selecao_confirmacao = 0;
        if (point_in_rectangle(_mx, _my, _cx + 20, _cy + 10, _cx + 180, _cy + 50)) selecao_confirmacao = 1;
    }
    
    // Mouse Clique nos botões do Popup
    if (_mouse_click) {
        if (point_in_rectangle(_mx, _my, _cx - 180, _cy + 10, _cx - 20, _cy + 50)) _enter = true;
        if (point_in_rectangle(_mx, _my, _cx + 20, _cy + 10, _cx + 180, _cy + 50)) _enter = true;
    }
    
    if (_enter || _esc) {
        if (_esc) selecao_confirmacao = 1; 
        
        if (selecao_confirmacao == 0) {
            salvar_configuracoes(); 
            room_goto(global.sala_anterior); 
        } else {
            global.resolucao_index = resolucao_original; 
            global.tela_modo = tela_original;
            global.video_qualidade = video_original;
            aplicar_tela(); 
            estado_confirmacao = false; 
        }
    }
    exit; 
}

// ==========================================
// 4. MODO MENU NORMAL
// ==========================================

// Teclado (AGORA USA menu_chaves)
selecao_atual = navegar_menu_vertical(selecao_atual, array_length(menu_chaves));

// Matemática de centralização para o Mouse (AGORA USA menu_chaves)
var _altura_total = (array_length(menu_chaves) - 1) * espacamento;
var _y_inicial = (room_height / 2) - (_altura_total / 2) + 30;

// Mouse Hover e Clique nas Opções
for (var i = 0; i < array_length(menu_chaves); i++) {
    var _y_item = _y_inicial + (i * espacamento);
    
    if (_my > _y_item - 20 && _my < _y_item + 20) {
        if (_mouse_moveu) selecao_atual = i;
        
        if (_mouse_click) {
            selecao_atual = i;
            
            // Hitboxes fixas APENAS para Tela, Resolução, Vídeo E IDIOMA (índices 1 a 4)
            if (i >= 1 && i <= 4) {
                var _x_dir = (room_width / 2) + 50;
                if (point_in_rectangle(_mx, _my, _x_dir - 20, _y_item - 20, _x_dir + 20, _y_item + 20)) _mov_h = -1;
                else if (point_in_rectangle(_mx, _my, _x_dir + 130, _y_item - 20, _x_dir + 170, _y_item + 20)) _mov_h = 1;
                else _mov_h = 1; 
            }
            
            // Skins(5), Controles(6) e Voltar(7) são BOTÕES CENTRAIS, forçam o _enter
            if (i >= 5) _enter = true; 
        }
        
        // ARRASTAR O SLIDER DE ÁUDIO
        if (i == 0 && _mouse_held) {
            selecao_atual = i;
            var _x_barra = (room_width / 2) + 50;
            var _largura_barra = 200;
            var _novo_volume = (_mx - _x_barra) / _largura_barra;
            global.vol_master = clamp(_novo_volume, 0, 1);
        }
    }
}

// Aplica Áudio via Teclado
if (selecao_atual == 0) {
    if (_esq_segurando) global.vol_master -= 0.01;
    if (_dir_segurando) global.vol_master += 0.01;
    global.vol_master = clamp(global.vol_master, 0, 1);
    audio_master_gain(global.vol_master);
}

// Executa as mudanças Visuais e Idioma
if (_mov_h != 0) {
    if (selecao_atual == 1) { 
        global.tela_modo += _mov_h;
        if (global.tela_modo < 0) global.tela_modo = 2;
        if (global.tela_modo > 2) global.tela_modo = 0;
        aplicar_tela();
    }
    if (selecao_atual == 2) { 
        global.resolucao_index += _mov_h;
        if (global.resolucao_index < 0) global.resolucao_index = array_length(global.resolucoes_w) - 1;
        if (global.resolucao_index >= array_length(global.resolucoes_w)) global.resolucao_index = 0;
        aplicar_tela(); 
    }
    if (selecao_atual == 3) { 
        global.video_qualidade += _mov_h;
        if (global.video_qualidade < 0) global.video_qualidade = 2;
        if (global.video_qualidade > 2) global.video_qualidade = 0;
    }
    // LÓGICA DO IDIOMA (Índice 4)
    if (selecao_atual == 4) { 
        global.idioma_atual += _mov_h;
        if (global.idioma_atual < 0) global.idioma_atual = 4; // Volta para JP
        if (global.idioma_atual > 4) global.idioma_atual = 0; // Volta para PT
    }
}

// ==========================================
// 5. IR PARA SKINS (Agora é o 5!)
// ==========================================
if (_enter && selecao_atual == 5) {
    salvar_configuracoes(); 
    room_goto(rm_skins); 
}

// ==========================================
// 6. IR PARA CONTROLES (Agora é o 6!)
// ==========================================
if (_enter && selecao_atual == 6) {
    salvar_configuracoes(); 
    room_goto(rm_controles); 
}

// ==========================================
// 7. VOLTAR AO MENU (Agora é o 7!)
// ==========================================
if ((_enter && selecao_atual == 7) || _esc) {
    var _mudou_tela = (global.tela_modo != tela_original);
    var _mudou_res = (global.resolucao_index != resolucao_original);
    var _mudou_video = (global.video_qualidade != video_original);
    var _mudou_skin = (global.skin_atual != skin_original); 
    var _mudou_idioma = (global.idioma_atual != idioma_original); // Adicionado check de idioma
    
    if (_mudou_tela || _mudou_res || _mudou_video || _mudou_skin || _mudou_idioma) {
        estado_confirmacao = true;
        selecao_confirmacao = 0;
    } else {
        salvar_configuracoes(); 
        room_goto(global.sala_anterior);
    }
}