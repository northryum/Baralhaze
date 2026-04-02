// --- scr_configuracoes ---
global.resolucoes_w = [800, 1024, 1280, 1366, 1920];
global.resolucoes_h = [600, 768, 720, 768, 1080];
global.texto_resolucao = ["800x600", "1024x768", "1280x720", "1366x768", "1920x1080"];


function carregar_configuracoes() {
    // Abre o arquivo (se não existir, o GM cria na memória temporária)
    ini_open("config.ini");
    
    // O último valor (ex: 1.0) é o padrão caso o arquivo seja novo
    global.vol_master = ini_read_real("Audio", "volume", 1.0);
    
    // 0 = Janela, 1 = Tela Cheia, 2 = Sem Borda
    global.tela_modo = ini_read_real("Tela", "modo", 0); 
    
    // 0 = Baixa, 1 = Média, 2 = Alta
    global.video_qualidade = ini_read_real("Video", "qualidade", 2); 
    global.resolucao_index = ini_read_real("Tela", "resolucao", 3);
	
    // Controles (Salvando o código numérico da tecla)
    global.tecla_cima = ini_read_real("Controles", "cima", vk_up);
    global.tecla_baixo = ini_read_real("Controles", "baixo", vk_down);
    global.tecla_esq = ini_read_real("Controles", "esquerda", vk_left);
    global.tecla_dir = ini_read_real("Controles", "direita", vk_right);
    global.tecla_confirmar = ini_read_real("Controles", "confirmar", vk_enter);
    
	global.skin_atual = ini_read_real("Visual", "Skin", 0);
	
	global.idioma_atual = ini_read_real("Visual", "Idioma", 0);
    ini_close();
    
    // Aplica as configurações visuais imediatamente
    aplicar_tela();
}

function salvar_configuracoes() {
    ini_open("config.ini");
    
    ini_write_real("Audio", "volume", global.vol_master);
    ini_write_real("Tela", "modo", global.tela_modo);
    ini_write_real("Video", "qualidade", global.video_qualidade);
    ini_write_real("Tela", "resolucao", global.resolucao_index);
	
    ini_write_real("Controles", "cima", global.tecla_cima);
    ini_write_real("Controles", "baixo", global.tecla_baixo);
    ini_write_real("Controles", "esquerda", global.tecla_esq);
    ini_write_real("Controles", "direita", global.tecla_dir);
    ini_write_real("Controles", "confirmar", global.tecla_confirmar);
    
	ini_write_real("Visual", "Skin", global.skin_atual);
	ini_write_real("Visual", "Idioma", global.idioma_atual);
    ini_close();
}

function aplicar_tela() {
    // Aplica o tamanho da janela primeiro
    var _w = global.resolucoes_w[global.resolucao_index];
    var _h = global.resolucoes_h[global.resolucao_index];
    
    window_set_size(_w, _h);
    
    // Centraliza a janela após redimensionar
    window_center();

    // Aplica o modo de tela
    switch (global.tela_modo) {
        case 0: // Janela Normal
            window_set_fullscreen(false);
            window_set_showborder(true);
            break;
        case 1: // Tela Cheia
            window_set_fullscreen(true);
            break;
        case 2: // Sem Borda
            window_set_fullscreen(false);
            window_set_showborder(false);
            window_set_rectangle(0, 0, display_get_width(), display_get_height());
            break;
    }
}

function nome_da_tecla(_tecla) {
    switch (_tecla) {
        case vk_up: return "Seta Cima";
        case vk_down: return "Seta Baixo";
        case vk_left: return "Seta Esquerda";
        case vk_right: return "Seta Direita";
        case vk_enter: return "Enter";
        case vk_space: return "Espaço";
        case vk_escape: return "Esc";
        case vk_shift: return "Shift";
        case vk_control: return "Ctrl";
        case vk_alt: return "Alt";
        case vk_tab: return "Tab";
        case vk_backspace: return "Backspace";
        default: 
            // Transforma o número na letra correspondente (Ex: 65 vira "A")
            return chr(_tecla); 
    }
}

function get_sprite_skin() {
	
	
    // Cria um array com os nomes exatos dos seus sprites na ordem das opções
    var _sprites = [spr_cartas_Padrao, spr_cartas_Arcade, spr_cartas_Taverna];
    
    // Retorna o sprite correspondente ao número salvo nas configurações
    return _sprites[global.skin_atual];
}

/*
function aplicar_tela() {
    switch (global.tela_modo) {
        case 0: // Janela Normal
            window_set_fullscreen(false);
            window_set_showborder(true);
            break;
        case 1: // Tela Cheia
            window_set_fullscreen(true);
            break;
        case 2: // Janela Sem Borda (Borderless)
            window_set_fullscreen(false);
            window_set_showborder(false);
            // Estica a janela para o tamanho do monitor 55555555555555555555555555555555555555555
            window_set_rectangle(0, 0, display_get_width(), display_get_height());
            break;
    }
}