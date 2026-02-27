if (obj_game_control.esperando_contestacao) exit; // O jogador também não pode jogar
// 1. Verifica se é o turno do jogador local (Jogador 0)
if (obj_game_control.turno_atual == 0) {
    
    var _cartas_selecionadas = 0;
    
    // 2. Conta quantas cartas estão selecionadas
    with (obj_carta) {
        if (selecionada) {
            _cartas_selecionadas++;
        }
    }
    
    // 3. Se o jogador selecionou pelo menos 1 carta, a jogada acontece
    if (_cartas_selecionadas > 0) {
        
        // Limpa a memória das últimas cartas jogadas, pois esta é uma nova jogada
        array_delete(obj_game_control.ultimas_cartas_jogadas, 0, array_length(obj_game_control.ultimas_cartas_jogadas));
        
        // 4. Passa por todas as cartas na tela
        with (obj_carta) {
            if (selecionada) {
                // Coloca o valor da carta nas arrays da mesa
                array_push(obj_game_control.pilha_mesa, valor);
                array_push(obj_game_control.ultimas_cartas_jogadas, valor);
                
				// Procure esta linha e mude para usar o 'x' e 'y' atuais:
				with (obj_carta_mesa) { instance_destroy(); }
				var _carta_visual = instance_create_layer(x, y, "Instances", obj_carta_mesa);
				_carta_visual.valor = valor;
				
                // Encontra a carta na array da mão do jogador 0 e remove
                for (var i = 0; i < array_length(obj_game_control.mao_jogador[0]); i++) {
                    if (obj_game_control.mao_jogador[0][i] == valor) {
                        array_delete(obj_game_control.mao_jogador[0], i, 1);
                        break; // Dá o break para remover apenas 1 cópia (caso tenha dois 'K', por exemplo)
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
        
        // 6. Passar o turno (Apenas um teste simples por enquanto)
        // No jogo real, precisaremos pular quem foi eliminado
        // Apague: obj_game_control.turno_atual = 1;
// Coloque isso no lugar:
obj_game_control.passar_turno();
        
    } else {
        show_debug_message("Selecione pelo menos uma carta!");
    }
    
} else {
    show_debug_message("Espere sua vez!");
}