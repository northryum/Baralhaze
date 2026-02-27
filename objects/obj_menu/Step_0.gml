// --- obj_menu: Step Event ---

// 1. INPUTS
var _up    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var _down  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var _esq   = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var _dir   = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// 2. MOVIMENTAÇÃO VERTICAL
var _mov_v = _down - _up;
if (_mov_v != 0) {
    selecao_atual += _mov_v;
    if (selecao_atual < 0) selecao_atual = array_length(opcoes) - 1;
    if (selecao_atual >= array_length(opcoes)) selecao_atual = 0;
}

// 3. LÓGICA HORIZONTAL (A/D)
var _mov_h = _dir - _esq;
if (_mov_h != 0) {
    // Linha 0: Modo de Jogo
    if (selecao_atual == 0) {
        modo_atual = clamp(modo_atual + _mov_h, 0, 1);
    }
    
    // Linha 1: Dificuldade (Bloqueada se modo_atual for 1)
    if (selecao_atual == 1 && modo_atual == 0) {
        global.dificuldade = clamp(global.dificuldade + _mov_h, 0, 2);
    }
}

// 4. AÇÕES AO APERTAR ENTER
if (_enter) {
    switch (selecao_atual) {
        case 0: // Selecionou a linha de "Modo"
        case 1: // Selecionou a linha de "Dificuldade"
            if (modo_atual == 0) {
                room_goto(rm_jogo_bots); 
            } else {
                room_goto(rm_lobby); 
            }
            break;
            
        case 2: room_goto(rm_tutorial); break;
        case 3: room_goto(rm_config);   break;
        case 4: game_end();             break;
    }
}