draw_set_font(Font_geral);
// --- obj_menu: Evento Draw ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 100, "Baralhanze", 3, 3, 0);

var _nomes_dificuldade = [tr("dif_facil"), tr("dif_normal"), tr("dif_dificil")];
var _cx = room_width / 2;

for (var i = 0; i < array_length(opcoes); i++) {
    var _y = room_height/2 + (i * espacamento);
    var _texto = tr(opcoes[i]);
    
    // Tratamento dos Textos
    if (i == 0) _texto = tr("menu_modo") + ((modo_atual == 0) ? tr("modo_solo") : tr("modo_multi_online"));
if (i == 1) {
        if (modo_atual == 1) {
            // Junta "Dificuldade: " + "Indisponível"
            _texto = tr("menu_dif") + tr("dif_indisp"); 
        } else {
            // Junta "Dificuldade: " + a dificuldade traduzida do array
            _texto = tr("menu_dif") + _nomes_dificuldade[global.dificuldade];
        }
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