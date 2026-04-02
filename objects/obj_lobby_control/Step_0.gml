// --- obj_lobby_control: Evento Step ---

// 1. INPUTS TECLADO
var _up    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var _down  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var _esq   = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var _dir   = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var _esc   = keyboard_check_pressed(vk_escape);

var _mov_v = _down - _up;
var _mov_h = _dir - _esq;

// 2. INPUTS MOUSE
var _mouse_click = mouse_check_button_pressed(mb_left);
var _mouse_moveu = (mouse_x != mx_prev || mouse_y != my_prev);
mx_prev = mouse_x;
my_prev = mouse_y;

var _cx = room_width / 2;

// --- NAVEGAÇÃO VERTICAL ---
if (_mov_v != 0) {
    selecao_atual += _mov_v;
    if (selecao_atual < 0) selecao_atual = array_length(opcoes) - 1;
    if (selecao_atual >= array_length(opcoes)) selecao_atual = 0;
}

// --- MOUSE HOVER E CLIQUE ---
for (var i = 0; i < array_length(opcoes); i++) {
    var _y_item = room_height/2 + (i * espacamento);
    
    if (mouse_y > _y_item - 20 && mouse_y < _y_item + 20) {
        if (_mouse_moveu) selecao_atual = i;
        
        if (_mouse_click) {
            selecao_atual = i;
            
            // Hitboxes fixas apenas para a linha 0 (Criar Partida)
            if (i == 0) {
                if (mouse_x < _cx - 150) _mov_h = -1;      // Seta Esquerda
                else if (mouse_x > _cx + 150) _mov_h = 1;  // Seta Direita
                else _enter = true;                        // Meio do texto
            } else {
                _enter = true;
            }
        }
    }
}

// --- LÓGICA HORIZONTAL (Mudar Pública/Privada) ---
if (_mov_h != 0 && selecao_atual == 0) {
    tipo_partida += _mov_h;
    // Faz o loop entre 0 (Pública) e 1 (Privada)
    if (tipo_partida < 0) tipo_partida = 1;
    if (tipo_partida > 1) tipo_partida = 0;
}

// --- AÇÕES DE CONFIRMAÇÃO ---
if (_enter) {
    switch (selecao_atual) {
        case 0: // CRIAR PARTIDA
            global.is_host = true;
            global.partida_privada = (tipo_partida == 1); // Salva se é privada
            with(obj_network_control) { iniciar_como_host(); }
            room_goto(rm_jogo_online);
            break;
            
        case 1: // ENTRAR EM PARTIDA (O Pop-up nativo!)
            // Abre uma caixa de diálogo travando o jogo até o usuário digitar e dar OK
            var _codigo = get_string("Digite o IP ou Código da Sala:", "127.0.0.1");
            
            if (_codigo != "") {
                global.ip_servidor = _codigo;
                global.is_host = false;
                with(obj_network_control) { iniciar_como_cliente(); }
                room_goto(rm_jogo_online);
            }
            break;
            
        case 2: // OPÇÕES
            room_goto(rm_config);
            break;
            
       case 3: // Configurações
            global.sala_anterior = room; // Salva que viemos do Menu Principal
            room_goto(rm_config);   
            break;
    }
}

if (_esc) room_goto(rm_menu);