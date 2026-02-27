if (jogo_acabou == false) {
    var _vencedor_id = -1;
    var _vivos = 0;
    var _ultimo_vivo = -1;

    // Checa quem está vivo e quem zerou a mão
    for (var i = 0; i < 4; i++) {
        if (jogador_ativo[i] == true) {
            _vivos++;
            _ultimo_vivo = i;
            
            if (array_length(mao_jogador[i]) == 0) {
                _vencedor_id = i;
            }
        }
    }

    // Vitória por sobrevivência (só sobrou 1)
    if (_vivos == 1) {
        _vencedor_id = _ultimo_vivo;
    }

    // SE ALGUÉM VENCEU
    if (_vencedor_id != -1) {
        jogo_acabou = true;
        
        if (_vencedor_id == 0) nome_vencedor = "VOCÊ VENCEU!";
        else nome_vencedor = "BOT " + string(_vencedor_id) + " VENCEU!";
    }
    
} else {
    // =========================================
    // NAVEGAÇÃO DO MENU DE FIM DE JOGO
    // =========================================
    var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
    var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
    var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

    selecao_fim += _down - _up;

    // Faz o menu dar a volta
    if (selecao_fim < 0) selecao_fim = array_length(opcoes_fim) - 1;
    if (selecao_fim >= array_length(opcoes_fim)) selecao_fim = 0;

    // Ações ao apertar Enter
    if (_enter) {
        switch (selecao_fim) {
            case 0: // Jogar Novamente
                room_restart(); // Reinicia a partida imediatamente
                break;
                
            case 1: // Opções
                room_goto(rm_opcoes); // Vai para a sala de opções
                break;
                
            case 2: // Menu Principal
                room_goto(rm_menu); // Volta para a sala do Menu
                break;
        }
    }
}


/*if (jogo_acabou == false) {
    var _vencedor_id = -1;
    var _vivos = 0;
    var _ultimo_vivo = -1;

    // 1. Checa se alguém zerou as cartas
    for (var i = 0; i < 4; i++) {
        if (jogador_ativo[i] == true) {
            _vivos++;
            _ultimo_vivo = i;
            
            if (array_length(mao_jogador[i]) == 0) {
                _vencedor_id = i;
            }
        }
    }

    // 2. Checa se sobrou apenas 1 jogador vivo (vitória por sobrevivência)
    if (_vivos == 1) {
        _vencedor_id = _ultimo_vivo;
    }

    // 3. SE ALGUÉM VENCEU:
    if (_vencedor_id != -1) {
        jogo_acabou = true;
        
        if (_vencedor_id == 0) nome_vencedor = "VOCÊ VENCEU!";
        else nome_vencedor = "BOT " + string(_vencedor_id) + " VENCEU!";
        
        // Destrói os botões normais para ninguém clicar mais
        instance_destroy(obj_botao_jogar);
        instance_destroy(obj_botao_contestar);
        
        // Cria os botões de fim de jogo
        instance_create_layer(room_width/2 - 100, room_height/2 + 150, "Instances", obj_botao_mais_um);
        instance_create_layer(room_width/2 + 100, room_height/2 + 150, "Instances", obj_botao_desistir);
    }
}