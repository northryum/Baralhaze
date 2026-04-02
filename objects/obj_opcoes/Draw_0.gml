// --- obj_opcoes: Evento Draw ---
draw_self();

// ATIVA A FONTE PARA OS ACENTOS FUNCIONAREM!
draw_set_font(Font_geral); 

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

// Título da Tela (Usando a chave que já criamos para o menu)
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 100, string_upper(tr("menu_config")), 2, 2, 0);

var _x_esq = room_width / 2 - 50; 
var _x_dir = room_width / 2 + 50; 

// A MATEMÁTICA AGORA USA O 'menu_chaves'
var _altura_total = (array_length(menu_chaves) - 1) * espacamento;
var _y_inicial = (room_height / 2) - (_altura_total / 2) + 30;

// Arrays locais traduzidos para Tela e Vídeo
var _txt_tela_array = [tr("tela_janela"), tr("tela_cheia"), tr("tela_borda")];
var _txt_video_array = [tr("vid_baixa"), tr("vid_media"), tr("vid_alta")];

for (var i = 0; i < array_length(menu_chaves); i++) {
    var _y = _y_inicial + (i * espacamento); 
    
    // TRADUZ A CHAVE PARA O IDIOMA ATUAL AQUI!
    var _texto = tr(menu_chaves[i]); 
    
    if (i == selecao_atual) draw_set_color(c_yellow); else draw_set_color(c_white);
    
    // ========================================
    // ITENS DE DUAS COLUNAS (Índices 0 a 4) 
    // Áudio(0), Tela(1), Resolução(2), Vídeo(3), IDIOMA(4)
    // ========================================
    if (i <= 4) {
        draw_set_halign(fa_right);
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
        else if (i >= 1 && i <= 4) {
            // Puxa o valor da variável correspondente
            var _valor = "";
            if (i == 1) _valor = _txt_tela_array[global.tela_modo];
            if (i == 2) _valor = global.texto_resolucao[global.resolucao_index]; // Resolução não precisa traduzir (são números)
            if (i == 3) _valor = _txt_video_array[global.video_qualidade];
            
            // Puxa o nome do idioma baseado na chave "lang_nome"
            if (i == 4) _valor = tr("lang_nome"); 
            
            if (i == selecao_atual) {
                draw_set_color(c_yellow);
                draw_text_transformed(_x_dir, _y, "<", 1.2, 1.2, 0);
                draw_text_transformed(_x_dir + 150, _y, ">", 1.2, 1.2, 0);
            } else {
                draw_set_color(c_white);
            }
            
            draw_set_halign(fa_center);
            draw_text_transformed(_x_dir + 75, _y, _valor, 1.2, 1.2, 0);
            draw_set_halign(fa_left);
        }
    }
    // ========================================
    // ITENS CENTRALIZADOS (Índices 5, 6 e 7)
    // Skins(5), Controles(6) e Voltar(7)
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
    draw_rectangle(_cx - 200, _cy - 100, _cx + 200, _cy + 100, true); 
    
    draw_set_halign(fa_center);
    // Texto do aviso traduzido
    draw_text(_cx, _cy - 50, tr("pop_aviso"));
    
    // Botões do popup traduzidos e com formatação de seleção
    var _str_manter = tr("pop_manter");
    var _str_reverter = tr("pop_reverter");
    
    var _txt_manter = (selecao_confirmacao == 0) ? "> " + _str_manter + " <" : _str_manter;
    var _txt_reverter = (selecao_confirmacao == 1) ? "> " + _str_reverter + " <" : _str_reverter;
    
    if (selecao_confirmacao == 0) draw_set_color(c_yellow); else draw_set_color(c_white);
    draw_text(_cx - 100, _cy + 30, _txt_manter);
    
    if (selecao_confirmacao == 1) draw_set_color(c_yellow); else draw_set_color(c_white);
    draw_text(_cx + 100, _cy + 30, _txt_reverter);
}

// Reset do Draw
draw_set_halign(fa_left); 
draw_set_valign(fa_top); 
draw_set_color(c_white);