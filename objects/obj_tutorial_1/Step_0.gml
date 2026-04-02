var _avancar = keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var _voltar = keyboard_check_pressed(vk_left);
var _sair = keyboard_check_pressed(vk_escape);

// Avançar página
if (_avancar) {
    pagina_atual++;
    
    // Se passou da última página, volta pro menu
    if (pagina_atual >= array_length(paginas)) {
        room_goto(rm_menu);
    }
}

// Voltar página
if (_voltar) {
    pagina_atual--;
    if (pagina_atual < 0) {
        pagina_atual = 0; // Não deixa ficar negativo
    }
}

// Sair direto pro menu apertando ESC
if (_sair) {
    room_goto(rm_menu);
}