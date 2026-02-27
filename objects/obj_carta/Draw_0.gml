draw_self();

// Desenha a carta baseada no valor dela
draw_sprite(spr_cartas, valor, x, y);

// Um contorno ou destaque se estiver selecionada (opcional, para feedback visual)
if (selecionada) {
    draw_set_color(c_yellow);
    draw_rectangle(x - 32, y - 48, x + 32, y + 48, true); // Ajuste os valores pro tamanho do seu sprite
    draw_set_color(c_white);
}