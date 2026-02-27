draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Título do Lobby
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 100, "LOBBY MULTIPLAYER", 2, 2, 0);

for (var i = 0; i < array_length(opcoes); i++) {
    if (i == selecao_atual) {
        draw_set_color(c_yellow);
        draw_text_transformed(room_width/2, room_height/2 + (i * espacamento), "> " + opcoes[i] + " <", 1.3, 1.3, 0);
    } else {
        draw_set_color(c_white);
        draw_text(room_width/2, room_height/2 + (i * espacamento), opcoes[i]);
    }
}