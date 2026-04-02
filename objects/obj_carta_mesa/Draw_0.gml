// --- obj_carta_mesa: Evento Draw ---

var _meu_sprite = get_sprite_skin();

if (virada_para_baixo) {
    // O verso agora é o frame 0!
    draw_sprite_ext(_meu_sprite, 0, x, y, 1, 1, image_angle, c_white, 1);
} else {
    // A carta revelada usa o valor + 1
    draw_sprite_ext(_meu_sprite, valor + 1, x, y, 1, 1, image_angle, c_white, 1);
}


/*draw_self();

if (virada_para_baixo == true) {
    draw_sprite_ext(spr_cartas, 4, x, y, 1, 1, image_angle, c_white, 1); // Frame 4 é o verso
} else {
    draw_sprite_ext(spr_cartas, valor, x, y, 1, 1, image_angle, c_white, 1); // Mostra o valor real (A, Q, K)
}