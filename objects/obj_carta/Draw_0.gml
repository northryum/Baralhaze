// --- obj_carta: Evento Draw ---
var _meu_sprite = get_sprite_skin();

if (selecionada) {
    // Adicionamos "+ 1" ao valor para pular o frame 0 (Verso)
    draw_sprite_ext(_meu_sprite, valor + 1, x, y - 20, 1, 1, 0, c_yellow, 1);
} else {
    draw_sprite_ext(_meu_sprite, valor + 1, x, y, 1, 1, 0, c_white, 1);
}

/*draw_self();

// Desenha a carta baseada no valor dela
draw_sprite(spr_cartas, valor, x, y);

// Um contorno ou destaque se estiver selecionada (opcional, para feedback visual)
if (selecionada) {
    draw_set_color(c_yellow);
    draw_rectangle(x - 32, y - 48, x + 32, y + 48, true); // Ajuste os valores pro tamanho do seu sprite
    draw_set_color(c_white);
}