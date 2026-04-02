

// 0=PT, 1=EN, 2=FR, 3=ES, 4=JP
global.idioma_atual = 0; 

// Nosso "Data Frame" de traduções
global.dicionario = {
    // Menus
    "op_audio": ["Áudio", "Audio", "Audio", "Audio", "音声"],
    "op_tela": ["Tela", "Screen", "Écran", "Pantalla", "画面"],
    "op_res": ["Resolução", "Resolution", "Résolution", "Resolución", "解像度"],
    "op_video": ["Vídeo", "Video", "Vidéo", "Video", "ビデオ"],
    "op_idioma": ["Idioma", "Language", "Langue", "Idioma", "言語"],
    "op_skins": ["Skins", "Skins", "Skins", "Capas", "スキン"],
    "op_controles": ["Controles", "Controls", "Contrôles", "Controles", "操作"],
    "op_voltar": ["Voltar", "Back", "Retour", "Volver", "戻る"],
    
    // Nomes dos Idiomas (Para mostrar na opção)
    "lang_nome": ["Português", "English", "Français", "Español", "日本語"],
    
    // Textos do Jogo
    "hud_sua_vez": ["-> SUA VEZ! <-", "-> YOUR TURN! <-", "-> À VOUS ! <-", "-> ¡TU TURNO! <-", "-> あなたの番！ <-"]
};
//if (global.idioma_atual == 4) draw_set_font(Font_jp); else draw_set_font(Font_geral);
// Função Tradutora
function tr(_chave) {
    // Checa se a chave existe no nosso dicionário
    if (variable_struct_exists(global.dicionario, _chave)) {
        // Retorna o texto na posição do idioma atual
        return global.dicionario[$ _chave][global.idioma_atual];
    }
    return _chave; // Se esquecer de traduzir algo, ele mostra a própria chave para não dar erro
}