function enviar_pacote(_buffer) {
    if (global.is_host) {
        if (instance_exists(obj_network_control)) {
            var _lista = obj_network_control.lista_clientes;
            for (var i = 0; i < ds_list_size(_lista); i++) {
                var _sock = ds_list_find_value(_lista, i);
                network_send_packet(_sock, _buffer, buffer_tell(_buffer));
            }
        }
    } else {
        network_send_packet(obj_network_control.socket, _buffer, buffer_tell(_buffer));
    }
}// --- Adicione no obj_network_control (ou em um Script) ---

function iniciar_como_host() {
    global.is_host = true;
    // O Host abre a porta e espera
    server = network_create_server(network_socket_tcp, global.porta, 4);
    if (server < 0) show_message("Erro: Porta " + string(global.porta) + " ocupada.");
}

function iniciar_como_cliente() {
    global.is_host = false;
    // O Cliente tenta se conectar ao IP armazenado
    conexao = network_connect(socket, global.ip_servidor, global.porta);
    if (conexao < 0) show_message("Erro: Não foi possível conectar ao IP " + global.ip_servidor);
}

function ler_pacote_dados(_buffer) {
    var _mensagem_id = buffer_read(_buffer, buffer_u8);
    
    switch (_mensagem_id) {
        case msg.dados_partida:
            // O Cliente recebe a semente do Host para sincronizar o baralho
            var _semente = buffer_read(_buffer, buffer_u32);
            var _objetivo = buffer_read(_buffer, buffer_u8);
            
            random_set_seed(_semente);
            global.carta_objetivo = _objetivo;
            
            show_debug_message("Partida Sincronizada! Semente: " + string(_semente));
            break;

        case msg.jogar_carta:
            // Alguém jogou uma carta na rede
            var _valor_carta = buffer_read(_buffer, buffer_u8);
            var _quem_jogou = buffer_read(_buffer, buffer_u8);
            
            // Aqui você chamaria a lógica visual de criar a carta na mesa
            // Ex: criar_carta_rede(_valor_carta, _quem_jogou);
            break;
            
        case msg.contestar:
            var _quem_contestou = buffer_read(_buffer, buffer_u8);
            contestar_jogada(_quem_contestou);
            break;
    }
}