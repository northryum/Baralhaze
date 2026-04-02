// --- obj_menu_skins: Evento Create ---
opcoes_skin = ["Padrão", "Arcade", "Taverna"];
// A seleção começa onde o jogador parou da última vez
selecao_atual = global.skin_atual; 

// Variáveis para animação (para a carta flutuar um pouco)
y_offset = 0;
tempo = 0;

mx_prev = mouse_x;
my_prev = mouse_y;