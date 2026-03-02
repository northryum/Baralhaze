// --- obj_opcoes: Evento Create ---

// Variáveis para rastrear o movimento do mouse no frame anterior
mx_prev = mouse_x;
my_prev = mouse_y;
aba_atual = 0; 
selecao_atual = 0;
espacamento = 60;

// AQUI ESTAVA O ERRO: A lista precisa ter exatamente 6 itens nesta ordem!
menu_raiz = ["Áudio", "Tela", "Resolução", "Vídeo", "Controles", "Voltar ao Menu"];

texto_tela = ["Janela", "Tela Cheia", "Sem Borda"];
texto_video = ["Baixa", "Média", "Alta"];

// Variáveis do Popup
estado_confirmacao = false; 
selecao_confirmacao = 0; 

// Backup do visual
resolucao_original = global.resolucao_index; 
tela_original = global.tela_modo;
video_original = global.video_qualidade;