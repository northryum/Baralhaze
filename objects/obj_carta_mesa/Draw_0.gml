draw_self();

if (virada_para_baixo == true) {
    draw_sprite_ext(spr_cartas, 4, x, y, 1, 1, image_angle, c_white, 1); // Frame 4 é o verso
} else {
    draw_sprite_ext(spr_cartas, valor, x, y, 1, 1, image_angle, c_white, 1); // Mostra o valor real (A, Q, K)
}