// --- obj_tutorial: Evento Draw ---
draw_set_font(Font_geral);
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
draw_text_transformed(room_width / 2, 50, tr("menu_tuto"), 2, 2, 0);

// Desenha o texto da página atual (A MÁGICA ACONTECE AQUI!)
draw_set_color(c_white);
// Puxa a chave do array e já passa pela tradução
var _texto = tr(paginas[pagina_atual]); 

// A função draw_text_ext(x, y, texto, separação_linhas, largura_maxima)
// impede que o texto vaze pelos cantos da tela!
// --- obj_tutorial: Evento Draw (Substitua a linha de desenho por esta) ---

// Definimos a escala que queremos
var _escala = 1.5;

// Calculamos a largura real que o texto deve ter ANTES de ser ampliado.
// room_width - 150 dá uma margem total de 75 pixels de cada lado (mais segura).
var _largura_base = room_width - 150;

// Dividimos a largura base pela escala. O resultado é o limite que o draw_text_ext vai usar.
var _limite_quebra = _largura_base / _escala;

// Agora usamos a variável calculada
draw_text_ext_transformed(room_width / 2, room_height / 2, _texto, 30, _limite_quebra, _escala, _escala, 0);

// Rodapé com os Controles e Indicador de Página
draw_set_valign(fa_bottom);
draw_set_color(c_ltgray);

// Monta o "Página X de Y" traduzido
var _indicador = tr("tuto_pg_atual") + string(pagina_atual + 1) + tr("tuto_pg_de") + string(array_length(paginas));
draw_text(room_width / 2, room_height - 60, _indicador);

// Controles traduzidos
draw_text(room_width / 2, room_height - 20, tr("tuto_rodape"));

// Reseta o alinhamento
draw_set_valign(fa_top);
draw_set_color(c_white);