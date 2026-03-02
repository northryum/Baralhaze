// --- obj_opcoes: Evento Draw ---
draw_self();
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

// Título da Tela
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 100, "CONFIGURAÇÕES", 2, 2, 0);

var _x_esq = room_width / 2 - 50; 
var _x_dir = room_width / 2 + 50; 

for (var i = 0; i < array_length(menu_raiz); i++) {
    var _y = room_height/2 + (i * espacamento);
    var _texto = menu_raiz[i];
    
    // Cor de Seleção
    if (i == selecao_atual) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    
    // ========================================
    // ITENS DE DUAS COLUNAS (Índices 0, 1, 2, 3)
    // ========================================
    if (i <= 3) {
        draw_set_halign(fa_right);
        // Coloca a setinha apenas no rótulo da esquerda
        var _txt_esq = (i == selecao_atual) ? "> " + _texto : _texto;
        draw_text_transformed(_x_esq, _y, _txt_esq, 1.2, 1.2, 0);
        
        draw_set_halign(fa_left);
        
        if (i == 0) { 
            // 0. BARRA DE ÁUDIO
            var _largura_barra = 200; 
            var _x_barra = _x_dir; 
            var _y_barra = _y - 5;
            
            draw_set_color(c_dkgray); 
            draw_rectangle(_x_barra, _y_barra, _x_barra + _largura_barra, _y_barra + 10, false);
            
            draw_set_color(c_lime); 
            draw_rectangle(_x_barra, _y_barra, _x_barra + (_largura_barra * global.vol_master), _y_barra + 10, false);
            
            draw_set_color(c_white); 
            draw_text(_x_barra + _largura_barra + 15, _y, string(round(global.vol_master * 100)) + "%");
        } 
        else if (i >= 1 && i <= 3) {
            // 1, 2 e 3. TELA, RESOLUÇÃO E VÍDEO
            var _valor = "";
            if (i == 1) _valor = texto_tela[global.tela_modo];
            if (i == 2) _valor = global.texto_resolucao[global.resolucao_index];
            if (i == 3) _valor = texto_video[global.video_qualidade];
            
            if (i == selecao_atual) {
                draw_set_color(c_yellow);
                // Desenha as Setas Fixas na tela
                draw_text_transformed(_x_dir, _y, "<", 1.2, 1.2, 0);
                draw_text_transformed(_x_dir + 150, _y, ">", 1.2, 1.2, 0);
            } else {
                draw_set_color(c_white);
            }
            
            // Desenha o valor centralizado perfeitamente entre as duas setas fixas
            draw_set_halign(fa_center);
            draw_text_transformed(_x_dir + 75, _y, _valor, 1.2, 1.2, 0);
            draw_set_halign(fa_left);
        }
    } 
    // ========================================
    // ITENS CENTRALIZADOS (Índices 4 e 5) - O QUE HAVIA SUMIDO!
    // ========================================
    else {
        draw_set_halign(fa_center);
        var _txt_centro = (i == selecao_atual) ? "> " + _texto + " <" : _texto;
        draw_text_transformed(room_width/2, _y, _txt_centro, 1.2, 1.2, 0);
    }
}

// --- POPUP DE CONFIRMAÇÃO ---
if (estado_confirmacao) {
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1.0);
    
    var _cx = room_width / 2;
    var _cy = room_height / 2;
    
    draw_set_color(c_dkgray);
    draw_rectangle(_cx - 200, _cy - 100, _cx + 200, _cy + 100, false);
    draw_set_color(c_white);
    draw_rectangle(_cx - 200, _cy - 100, _cx + 200, _cy + 100, true); // Borda
    
    draw_set_halign(fa_center);
    draw_text(_cx, _cy - 50, "Configurações visuais não salvas.\nDeseja manter e sair ou reverter?");
    
    var _txt_manter = (selecao_confirmacao == 0) ? "> Manter Alterações <" : "Manter Alterações";
    var _txt_reverter = (selecao_confirmacao == 1) ? "> Reverter <" : "Reverter";
    
    if (selecao_confirmacao == 0) draw_set_color(c_yellow); else draw_set_color(c_white);
    draw_text(_cx - 100, _cy + 30, _txt_manter);
    
    if (selecao_confirmacao == 1) draw_set_color(c_yellow); else draw_set_color(c_white);
    draw_text(_cx + 100, _cy + 30, _txt_reverter);
}

// Reset do Draw para não vazar a formatação para outras telas
draw_set_halign(fa_left); 
draw_set_valign(fa_top); 
draw_set_color(c_white);