function iniciar_como_host() {
    global.is_host = true;
    server = network_create_server(network_socket_tcp, global.porta, 4);
    if (server < 0) show_message("Erro ao criar servidor!");
}

function iniciar_como_cliente() {
    global.is_host = false;
    conexao = network_connect(socket, global.ip_servidor, global.porta);
    if (conexao < 0) show_message("Erro: Não foi possível conectar ao Host.");
}