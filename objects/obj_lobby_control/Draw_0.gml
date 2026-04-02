// --- obj_lobby_control: Evento Draw ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Título
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 100, "LOBBY MULTIPLAYER", 2, 2, 0);

var _cx = room_width / 2;

for (var i = 0; i < array_length(opcoes); i++) {
    var _y = room_height/2 + (i * espacamento);
    var _texto = opcoes[i];
    
    // Tratamento dinâmico para a primeira linha
    if (i == 0) {
        var _txt_tipo = (tipo_partida == 0) ? "Pública" : "Privada";
        _texto = "Criar Partida: " + _txt_tipo;
    }
    
    if (i == selecao_atual) {
        draw_set_color(c_yellow);
        draw_text_transformed(_cx, _y, _texto, 1.2, 1.2, 0);
        
        // Desenha as setas fixas APENAS na primeira opção
        if (i == 0) {
            draw_text_transformed(_cx - 200, _y, "<", 1.2, 1.2, 0);
            draw_text_transformed(_cx + 200, _y, ">", 1.2, 1.2, 0);
        }
    } else {
        draw_set_color(c_white);
        draw_text(_cx, _y, _texto);
    }
}

// Reseta o alinhamento
draw_set_halign(fa_left); 
draw_set_valign(fa_top);