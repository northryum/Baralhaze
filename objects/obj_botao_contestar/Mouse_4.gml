// 1. Verifica se é a vez do jogador local (Jogador 0)
if (obj_game_control.turno_atual == 0) {
    
    // 2. Só pode contestar se houver cartas recém jogadas na mesa
    if (array_length(obj_game_control.ultimas_cartas_jogadas) > 0) {
        
        show_debug_message("Jogador 0 contestou a jogada!");
        
        // 3. Chama a função de contestar, dizendo que quem contestou foi o ID 0
        obj_game_control.contestar_jogada(0);
        
        // 4. Passa o turno para o próximo jogador vivo
        obj_game_control.passar_turno();
        
    } else {
        show_debug_message("A mesa está vazia, não há o que contestar!");
    }
    
} else {
    show_debug_message("Não é sua vez de contestar!");
}