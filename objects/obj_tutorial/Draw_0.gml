draw_self();

// Fundo (opcional, caso sua sala não tenha cor de fundo)
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Configurações de Texto
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Título Fixo no topo
draw_set_color(c_yellow);
draw_text_transformed(room_width / 2, 50, "COMO JOGAR", 2, 2, 0);

// Desenha o texto da página atual
draw_set_color(c_white);
var _texto = paginas[pagina_atual];

// A função draw_text_ext(x, y, texto, separação_linhas, largura_maxima)
// impede que o texto vaze pelos cantos da tela!
draw_text_ext_transformed(room_width / 2, room_height / 2, _texto, 30, room_width - 100, 1.5, 1.5, 0);

// Rodapé com os Controles e Indicador de Página
draw_set_valign(fa_bottom);
draw_set_color(c_ltgray);

var _indicador = "Página " + string(pagina_atual + 1) + " de " + string(array_length(paginas));
draw_text(room_width / 2, room_height - 60, _indicador);
draw_text(room_width / 2, room_height - 20, "Setas: Navegar  |  ESC: Voltar ao Menu");

// Reseta o alinhamento
draw_set_valign(fa_top);
draw_set_color(c_white);