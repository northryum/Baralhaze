// --- obj_menu: Evento Draw ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 100, "Baralhanze", 3, 3, 0);

var _nomes_dificuldade = ["Fácil", "Normal", "Difícil"];
var _cx = room_width / 2;

for (var i = 0; i < array_length(opcoes); i++) {
    var _y = room_height/2 + (i * espacamento);
    var _texto = opcoes[i];
    
    // Tratamento dos Textos
    if (i == 0) _texto = "Modo de Jogo: " + ((modo_atual == 0) ? "Solo" : "Multiplayer Online");
    if (i == 1) {
        if (modo_atual == 1) _texto = "Dificuldade: Indisponível"; 
        else _texto = "Dificuldade: " + _nomes_dificuldade[global.dificuldade];
    }
    
    // Desenho
    if (i == selecao_atual) {
        if (i == 1 && modo_atual == 1) draw_set_color(c_dkgray); 
        else draw_set_color(c_yellow);
        
        draw_text_transformed(_cx, _y, _texto, 1.2, 1.2, 0);
        
        // Desenha as setas FIXAS a 200 pixels do centro
        if (i == 0 || (i == 1 && modo_atual == 0)) {
            draw_text_transformed(_cx - 200, _y, "<", 1.2, 1.2, 0);
            draw_text_transformed(_cx + 200, _y, ">", 1.2, 1.2, 0);
        }
    } else {
        if (i == 1 && modo_atual == 1) draw_set_color(c_dkgray); 
        else draw_set_color(c_white);
        draw_text(_cx, _y, _texto);
    }
}
draw_set_halign(fa_left); draw_set_valign(fa_top);