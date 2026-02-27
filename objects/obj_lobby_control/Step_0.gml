var _up    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var _down  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

selecao_atual += _down - _up;
if (selecao_atual < 0) selecao_atual = array_length(opcoes) - 1;
if (selecao_atual >= array_length(opcoes)) selecao_atual = 0;

// --- obj_lobby_control: Step ---
if (_enter) {
    switch (selecao_atual) {
// --- Dentro do switch(selecao_atual) no Enter ---

case 0: // CRIAR SESSÃO
    global.is_host = true;
    with(obj_network_control) { iniciar_como_host(); } // Liga o servidor
    room_goto(rm_jogo_online);
    break;

case 1: // ENTRAR EM SESSÃO
    var _ip = get_string("Digite o IP do Host:", "127.0.0.1");
    if (_ip != "") {
        global.ip_servidor = _ip;
        global.is_host = false;
        with(obj_network_control) { iniciar_como_cliente(); } // Tenta conectar
        room_goto(rm_jogo_online);
    }
    break;
    }
}