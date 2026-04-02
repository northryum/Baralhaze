// --- obj_controles: Evento Step ---

// Capturando a nova tecla
if (esperando_tecla) {
    // A função keyboard_check_pressed(vk_anykey) checa se QUALQUER tecla foi apertada
    if (keyboard_check_pressed(vk_anykey)) {
        var _nova_tecla = keyboard_key; // Pega o número da tecla apertada
        
        // Se o cara apertar ESC, a gente cancela a operação
        if (_nova_tecla == vk_escape) {
            esperando_tecla = false;
            exit;
        }
        
        // Atribui a nova tecla na variável global correspondente
        switch (selecao_atual) {
            case 0: global.tecla_cima = _nova_tecla; break;
            case 1: global.tecla_baixo = _nova_tecla; break;
            case 2: global.tecla_esq = _nova_tecla; break;
            case 3: global.tecla_dir = _nova_tecla; break;
            case 4: global.tecla_confirmar = _nova_tecla; break;
        }
        
        esperando_tecla = false; // Sai do modo de escuta
    }
    
    // Se clicar com o mouse fora, cancela
    if (mouse_check_button_pressed(mb_left)) esperando_tecla = false;
    
    exit;
}

// ==========================================
// MODO MENU NORMAL: Navegação Teclado + Mouse
// ==========================================
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var _esc   = keyboard_check_pressed(vk_escape);

var _mouse_click = mouse_check_button_pressed(mb_left);
var _mouse_moveu = (mouse_x != mx_prev || mouse_y != my_prev);
mx_prev = mouse_x;
my_prev = mouse_y;

// Navegação via Teclado
selecao_atual = navegar_menu_vertical(selecao_atual, array_length(menu_controles));

// Navegação via Mouse
for (var i = 0; i < array_length(menu_controles); i++) {
    var _y_item = room_height/2 + (i * espacamento);
    if (mouse_y > _y_item - 20 && mouse_y < _y_item + 20) {
        if (_mouse_moveu) selecao_atual = i;
        if (_mouse_click) {
            selecao_atual = i;
            _enter = true;
        }
    }
}

// Ações de Confirmação
if (_enter) {
    if (selecao_atual <= 4) {
        // Clicou em um controle -> Entra no modo de captura!
        esperando_tecla = true;
    } 
    else if (selecao_atual == 5) {
        // Clicou em Voltar -> Salva no arquivo INI e volta pra tela de configurações
        salvar_configuracoes();
        room_goto(rm_config); 
    }
}

// Se apertar ESC sem estar configurando nada, volta para as opções
if (_esc) {
    salvar_configuracoes();
    room_goto(rm_config);
}