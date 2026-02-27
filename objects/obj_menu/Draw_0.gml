draw_self();

// Título do Jogo
draw_set_halign(fa_center);
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, room_height/4, "Baralhaze", 3, 3, 0); // Mude para o nome do seu jogo!

// Desenhando a coluna de opções
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(opcoes); i++) {
// Cria uma variável temporária para o texto que será exibido
    var _texto_exibir = opcoes[i];
    // Se for a opção que o jogador está selecionando, pinta de amarelo e põe umas setinhas
	if (i == 1) {
        _texto_exibir += texto_dificuldade[global.dificuldade];
    }
    if (i == selecao_atual) {
		
        draw_set_color(c_yellow);
        draw_text_transformed(room_width/2, room_height/2 + (i * espacamento), "> " + _texto_exibir + " <", 1.5, 1.5, 0);
    } 
    // Se não, desenha normal em branco
    else {
        draw_set_color(c_white);
        draw_text_transformed(room_width/2, room_height/2 + (i * espacamento), opcoes[i], 1.2, 1.2, 0);
    }
	
}

// Reseta o alinhamento para não bugar outras coisas do jogo
draw_set_valign(fa_top);
draw_set_color(c_white);