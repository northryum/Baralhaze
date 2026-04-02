// --- obj_opcoes: Evento Create ---
aba_atual = 0; 
selecao_atual = 0;
espacamento = 60;

//menu_raiz = ["Áudio", "Tela", "Resolução", "Vídeo", "Skins", "Controles", "Voltar"];

menu_chaves = ["op_audio", "op_tela", "op_res", "op_video", "op_idioma", "op_skins", "op_controles", "op_voltar"];


idioma_original = global.idioma_atual;

texto_tela = ["Janela", "Tela Cheia", "Sem Borda"];
texto_video = ["Baixa", "Média", "Alta"];

// Variáveis do Popup
estado_confirmacao = false; 
selecao_confirmacao = 0; 

// Backup do visual
resolucao_original = global.resolucao_index; 
tela_original = global.tela_modo;
video_original = global.video_qualidade;

// Descomentei isso para o popup saber se você mudou a skin lá na outra tela e voltou!
skin_original = global.skin_atual; 

// Variáveis de Mouse
mx_prev = mouse_x;
my_prev = mouse_y;