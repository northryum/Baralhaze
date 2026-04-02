// --- obj_menu_skins: Evento Step ---

// 1. INPUTS
var _esq   = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var _dir   = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var _esc   = keyboard_check_pressed(vk_escape);

var _mouse_click = mouse_check_button_pressed(mb_left);
var _mouse_moveu = (mouse_x != mx_prev || mouse_y != my_prev);
mx_prev = mouse_x;
my_prev = mouse_y;

// 2. LÓGICA DE SELEÇÃO
var _move = _dir - _esq;

if (_move != 0) {
    selecao_atual += _move;
    if (selecao_atual < 0) selecao_atual = array_length(opcoes_skin) - 1;
    if (selecao_atual >= array_length(opcoes_skin)) selecao_atual = 0;
    
    // Atualiza a global em tempo real para o preview funcionar
    global.skin_atual = selecao_atual; 
}

// 3. DETECÇÃO DE CLIQUES NAS SETAS (Opcional, mas bom para o mouse)
if (_mouse_click) {
    if (mouse_x < room_width/2 - 150) { selecao_atual--; _move = -1; }
    if (mouse_x > room_width/2 + 150) { selecao_atual++; _move = 1; }
    
    // Ajusta limites
    if (selecao_atual < 0) selecao_atual = array_length(opcoes_skin) - 1;
    if (selecao_atual >= array_length(opcoes_skin)) selecao_atual = 0;
    global.skin_atual = selecao_atual;
}

// 4. CONFIRMAR E VOLTAR
if (_enter || _esc) {
    salvar_configuracoes(); // Salva a skin escolhida no INI
    room_goto(rm_config); // Volta para onde o jogador estava
}

// Animação de flutuar (efeito senoidal)
tempo += 0.05;
y_offset = sin(tempo) * 10;