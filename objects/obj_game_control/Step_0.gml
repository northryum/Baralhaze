if (jogo_acabou == false) {
    var _vencedor_id = -1;
    var _vivos = 0;
    var _ultimo_vivo = -1;

    // Checa quem está vivo e quem zerou a mão
    for (var i = 0; i < 4; i++) {
        if (jogador_ativo[i] == true) {
            _vivos++;
            _ultimo_vivo = i;
            
if (array_length(mao_jogador[i]) == 0 && array_length(ultimas_cartas_jogadas) == 0) {
                _vencedor_id = i;
            }
        }
    }

    // Vitória por sobrevivência (só sobrou 1)
   // Vitória por sobrevivência (só sobrou 1)
    if (_vivos == 1) {
        _vencedor_id = _ultimo_vivo;
    }

    // SE ALGUÉM VENCEU
    if (_vencedor_id != -1) {
        jogo_acabou = true;
        
        // A MÁGICA É ESSA: Guardamos APENAS o ID bruto de quem venceu.
        // E removemos o nome_vencedor daqui!
        vencedor_final = _vencedor_id; 
    }
    
} else {
    // =========================================
    // NAVEGAÇÃO DO MENU DE FIM DE JOGO
    // =========================================
// 1. Inputs do Teclado
    var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
    var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
    var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
    
    // 2. Inputs do Mouse
    var _mouse_click = mouse_check_button_pressed(mb_left);
    var _mouse_moveu = (mouse_x != mx_prev || mouse_y != my_prev);
    mx_prev = mouse_x;
    my_prev = mouse_y;

    // --- Navegação pelo Teclado ---
    var _mov_v = _down - _up;
    if (_mov_v != 0) {
        selecao_fim += _mov_v;
        if (selecao_fim < 0) selecao_fim = array_length(opcoes_fim) - 1;
        if (selecao_fim >= array_length(opcoes_fim)) selecao_fim = 0;
    }

    // --- Navegação pelo Mouse ---
    var _espaco = 50; // Tem que ser O MESMO valor usado no evento Draw!
    
    for (var i = 0; i < array_length(opcoes_fim); i++) {
        // A MESMA matemática do seu Draw
        var _y_item = (room_height / 2) + 30 + (i * _espaco); 
        
        // Se o mouse estiver na linha dessa opção (com 20 pixels de margem para cima e para baixo)
        if (mouse_y > _y_item - 20 && mouse_y < _y_item + 20) {
            
            // Hover: Se o mouse se mexer, a cor amarela acompanha
            if (_mouse_moveu) {
                selecao_fim = i;
            }
            
            // Clique: Finge que você apertou a tecla Enter
            if (_mouse_click) {
                selecao_fim = i;
                _enter = true;
            }
        }
    }

// --- Ações ao confirmar (Teclado ou Mouse) ---
    if (_enter) {
        switch (selecao_fim) {
            case 0: // Jogar Novamente
                room_persistent = false; // Garante que a sala perca o congelamento
                room_restart(); // Reinicia limpo
                break;
                
            case 1: // Opções
                global.sala_anterior = room; // Salva que viemos do jogo
                room_persistent = true; // CONGELA O JOGO E A TELA DE GAME OVER!
                room_goto(rm_config); 
                break;
                
            case 2: // Menu Principal
                room_persistent = false; // Remove o congelamento para não bugar partidas futuras
                room_goto(rm_menu); 
                break;
        }
    }
}