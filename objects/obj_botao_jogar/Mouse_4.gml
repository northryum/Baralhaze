// 1. Verifica se o jogo está travado esperando alguém pensar
if (obj_game_control.esperando_contestacao) exit; 

// ==========================================
// TRAVA DE CONTESTAÇÃO OBRIGATÓRIA
// ==========================================
// Se o jogador anterior ficou sem cartas, você é obrigado a clicar em "Contestar"
if (obj_game_control.quem_jogou_ultimo != -1) {
    if (array_length(obj_game_control.mao_jogador[obj_game_control.quem_jogou_ultimo]) == 0) {
        show_debug_message("Você é OBRIGADO a contestar! O botão de jogar está bloqueado.");
        exit; // Para a execução do código aqui e não deixa você jogar cartas.
    }
}

// 2. Verifica se é o turno do jogador local (Jogador 0)
if (obj_game_control.turno_atual == 0) {
    
    var _cartas_selecionadas = 0;
    
    // Conta quantas cartas estão selecionadas
    with (obj_carta) {
        if (selecionada) {
            _cartas_selecionadas++;
        }
    }
    
    // 3. Se o jogador selecionou pelo menos 1 carta, a jogada acontece
    if (_cartas_selecionadas > 0) {
        
        // Limpa a memória das últimas cartas jogadas
if (array_length(obj_game_control.ultimas_cartas_jogadas) > 0) {
        array_delete(obj_game_control.ultimas_cartas_jogadas, 0, array_length(obj_game_control.ultimas_cartas_jogadas));
    }
        // CORREÇÃO: Limpa as cartas visuais da mesa APENAS UMA VEZ antes de colocar as novas
        with (obj_carta_mesa) { instance_destroy(); }
        
        // 4. Passa por todas as cartas na tela
        with (obj_carta) {
            if (selecionada) {
                // Coloca o valor da carta nas arrays da mesa
                array_push(obj_game_control.pilha_mesa, valor);
                array_push(obj_game_control.ultimas_cartas_jogadas, valor);
                
                // Cria a carta visual na mesa
                var _carta_visual = instance_create_layer(x, y, "Instances", obj_carta_mesa);
                _carta_visual.valor = valor;
                
                // Encontra a carta na array da mão do jogador 0 e remove
                for (var i = 0; i < array_length(obj_game_control.mao_jogador[0]); i++) {
                    if (obj_game_control.mao_jogador[0][i] == valor) {
                        array_delete(obj_game_control.mao_jogador[0], i, 1);
                        break; // Dá o break para remover apenas 1 cópia
                    }
                }
                
                // Destrói a carta visual da mão
                instance_destroy();
            }
        }
        
        // 5. Atualiza quem foi o último a jogar
        obj_game_control.quem_jogou_ultimo = 0;
        
        show_debug_message("Cartas enviadas para a mesa!");
        show_debug_message("Total de cartas na mesa: " + string(array_length(obj_game_control.pilha_mesa)));
        
        // 6. Passar o turno
        obj_game_control.passar_turno();
        
    } else {
        show_debug_message("Selecione pelo menos uma carta!");
    }
    
} else {
    show_debug_message("Espere sua vez!");
}