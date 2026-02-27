draw_self();

// Título do Jogo
draw_set_halign(fa_center);
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, room_height/4, "Baralhanze", 3, 3, 0);

// Desenhando a coluna de opções
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(opcoes); i++) {
    // 1. Criamos a variável base
    var _texto_exibir = opcoes[i];
    
    // 2. Adicionamos os sufixos dinâmicos
    if (i == 0) _texto_exibir += texto_modo[modo_atual];
    if (i == 1) _texto_exibir += texto_dificuldade[global.dificuldade];
    
    // 3. Lógica de cores e destaque
    if (i == selecao_atual) {
        draw_set_color(c_yellow);
        // Desenhamos o texto completo com as setinhas
        draw_text_transformed(room_width/2, room_height/2 + (i * espacamento), "> " + _texto_exibir + " <", 1.5, 1.5, 0);
    } 
    else {
        // Se o modo for Multiplayer, podemos deixar a dificuldade cinza (opcional)
        if (i == 1 && modo_atual == 1) draw_set_color(c_dkgray);
        else draw_set_color(c_white);
        
        // AQUI ESTAVA O ERRO: Use _texto_exibir para aparecer o Modo/Dificuldade mesmo sem seleção
        draw_text_transformed(room_width/2, room_height/2 + (i * espacamento), _texto_exibir, 1.2, 1.2, 0);
    }
}

// Reseta o alinhamento e cor para o padrão do sistema
draw_set_valign(fa_top);
draw_set_color(c_white);