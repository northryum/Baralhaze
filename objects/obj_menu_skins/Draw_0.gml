// --- obj_menu_skins: Evento Draw ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Título
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 80, tr("skins_titulo"), 2, 2, 0);

// Puxa o sprite da skin selecionada no momento
var _spr_preview = get_sprite_skin();

// Desenha a Frente (Ás) e o Verso bem grandes no centro
var _x_centro = room_width / 2;
var _y_centro = room_height / 2;

// Carta da Frente agora é o Frame 1
draw_sprite_ext(_spr_preview, 0, _x_centro - 120, _y_centro + y_offset, 3, 3, -5, c_white, 1);

// Carta do Verso agora é o Frame 0
draw_sprite_ext(_spr_preview, 1, _x_centro + 120, _y_centro - y_offset, 3, 3, 5, c_white, 1);


// Seletor de Nome (estilo Dificuldade)
draw_set_color(c_white);
var _txt_modelo = tr("skins_modelo") + opcoes_skin[selecao_atual] + " >";
draw_text_transformed(_x_centro, _y_centro + 180, _txt_modelo, 1.5, 1.5, 0);

// Rodapé de instrução
draw_set_color(c_ltgray);
draw_text(_x_centro, room_height - 50, tr("skins_instrucao"));

draw_set_halign(fa_left); draw_set_valign(fa_top);