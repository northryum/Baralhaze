// --- obj_menu: Evento Step ---
var _up    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var _down  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var _esq   = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var _dir   = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

var _mov_v = _down - _up;
var _mov_h = _dir - _esq;

var _mouse_click = mouse_check_button_pressed(mb_left);
var _mouse_moveu = (mouse_x != mx_prev || mouse_y != my_prev);
mx_prev = mouse_x;
my_prev = mouse_y;

var _cx = room_width / 2;

// NAVEGAÇÃO VERTICAL
if (_mov_v != 0) {
    selecao_atual += _mov_v;
    if (selecao_atual < 0) selecao_atual = array_length(opcoes) - 1;
    if (selecao_atual >= array_length(opcoes)) selecao_atual = 0;
}

// MOUSE HOVER E CLIQUE
for (var i = 0; i < array_length(opcoes); i++) {
    var _y_item = room_height/2 + (i * espacamento);
    
    if (mouse_y > _y_item - 20 && mouse_y < _y_item + 20) {
        if (_mouse_moveu) selecao_atual = i;
        
        if (_mouse_click) {
            selecao_atual = i;
            
            // Hitboxes fixas (Exatamente onde as setas serão desenhadas)
            if (i == 0 || (i == 1 && modo_atual == 0)) {
                // Seta Esquerda (x entre -250 e -150 do centro)
                if (point_in_rectangle(mouse_x, mouse_y, _cx - 250, _y_item - 20, _cx - 150, _y_item + 20)) _mov_h = -1;
                // Seta Direita (x entre +150 e +250 do centro)
                else if (point_in_rectangle(mouse_x, mouse_y, _cx + 150, _y_item - 20, _cx + 250, _y_item + 20)) _mov_h = 1;
                else _enter = true; // Clicou no meio do texto
            } else {
                _enter = true;
            }
        }
    }
}

// LÓGICA HORIZONTAL
if (_mov_h != 0) {
    if (selecao_atual == 0) modo_atual = clamp(modo_atual + _mov_h, 0, 1);
    if (selecao_atual == 1 && modo_atual == 0) global.dificuldade = clamp(global.dificuldade + _mov_h, 0, 2);
}

// AÇÕES DE CONFIRMAÇÃO
if (_enter) {
    switch (selecao_atual) {
        case 0: 
        case 1:
            if (modo_atual == 0) room_goto(rm_jogo_bots); else room_goto(rm_lobby); 
            break;
        case 2: room_goto(rm_tutorial); break;
        case 3: room_goto(rm_config);   break;
        case 4: game_end();             break;
    }
}