// --- scr_interface ---

function navegar_menu_vertical(_selecao_atual, _tamanho_array) {
    // 1. Captura as teclas
    var _up   = keyboard_check_pressed(vk_up)   || keyboard_check_pressed(ord("W"));
    var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
    
    // 2. Calcula a direção
    var _mov_v = _down - _up;
    
    // 3. Aplica o movimento com o loop (vai do fim pro começo e vice-versa)
    if (_mov_v != 0) {
        _selecao_atual += _mov_v;
        if (_selecao_atual < 0) _selecao_atual = _tamanho_array - 1;
        if (_selecao_atual >= _tamanho_array) _selecao_atual = 0;
    }
    
    // 4. Devolve o novo valor para o objeto usar
    return _selecao_atual;
}

