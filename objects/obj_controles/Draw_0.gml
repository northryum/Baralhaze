    // =========================================
    // obj_controles: Evento Draw
    // =========================================
draw_set_valign(fa_middle);

draw_set_halign(fa_center);
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 100, "CONTROLES", 2, 2, 0);

var _x_esq = room_width / 2 - 50; 
var _x_dir = room_width / 2 + 50; 

// Puxa as variáveis globais atuais para um array temporário só pra desenhar fácil
var _teclas_atuais = [
    global.tecla_cima, 
    global.tecla_baixo, 
    global.tecla_esq, 
    global.tecla_dir, 
    global.tecla_confirmar
];

for (var i = 0; i < array_length(menu_controles); i++) {
    var _y = room_height/2 + (i * espacamento);
    var _texto = menu_controles[i];
    
    if (i == selecao_atual) draw_set_color(c_yellow); else draw_set_color(c_white);
    
    // Layout de duas colunas para as teclas
    if (i <= 4) {
        draw_set_halign(fa_right);
        var _txt_esq = (i == selecao_atual && !esperando_tecla) ? "> " + _texto : _texto;
        draw_text_transformed(_x_esq, _y, _txt_esq, 1.2, 1.2, 0);
        
        draw_set_halign(fa_left);
        
        // Se estiver esperando uma tecla E for a linha selecionada, mostra o aviso
        if (i == selecao_atual && esperando_tecla) {
            draw_set_color(c_lime);
            draw_text_transformed(_x_dir, _y, "[ Pressione nova tecla ]", 1.2, 1.2, 0);
        } else {
            // Se não, mostra o nome da tecla atual traduzida
            var _nome = nome_da_tecla(_teclas_atuais[i]);
            draw_text_transformed(_x_dir, _y, _nome, 1.2, 1.2, 0);
        }
    } 
    // Botão de Voltar centralizado
    else {
        draw_set_halign(fa_center);
        var _txt_centro = (i == selecao_atual) ? "> " + _texto + " <" : _texto;
        draw_text_transformed(room_width/2, _y, _txt_centro, 1.2, 1.2, 0);
    }
}

draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white);