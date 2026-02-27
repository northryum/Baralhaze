// --- Step Event ---

// Captura as teclas
var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// 1. Move a seleção Vertical (Cima/Baixo)
selecao_atual += _down - _up;

if (selecao_atual < 0) selecao_atual = array_length(opcoes) - 1;
if (selecao_atual >= array_length(opcoes)) selecao_atual = 0;

// 2. Lógica Horizontal (A/D ou Setas Laterais) - SÓ funciona se estiver na linha da Dificuldade
if (selecao_atual == 1) {
    var _dir = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
    var _esq = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
    
    var _mudanca = _dir - _esq;
    if (_mudanca != 0) {
        global.dificuldade += _mudanca;
        // Limita entre 0 e 2
        global.dificuldade = clamp(global.dificuldade, 0, 2);
    }
}

// 3. Ações ao apertar Enter
if (_enter) {
    switch (selecao_atual) {
        case 0: // Jogar com Bots
            room_goto(rm_jogo); 
            break;
            
        case 1: // Dificuldade
            // Geralmente não fazemos nada no Enter da dificuldade, 
            // pois ela já muda com as setas laterais.
            break;
            
        case 2: // Tutorial
            room_goto(rm_tutorial); 
            break;
            
        case 3: // Opções
            room_goto(rm_opcoes); 
            break;
            
        case 4: // Sair
            game_end();
            break;
    }
}