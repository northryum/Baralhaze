selecao_atual = 0;
espacamento = 60;







// Opções do Lobby

selecao_atual = 0;
espacamento = 60;
opcoes = ["Criar Partida Pública", "Criar Partida Privada", "Opções", "Voltar ao Menu" ];

// Variáveis de conexão
global.is_host = false;
global.ip_servidor = "127.0.0.1";
global.porta = 6510; // Uma porta aleatória que não esteja em uso

socket = network_create_socket(network_socket_tcp);
lista_clientes = ds_list_create(); // Apenas para o Host guardar quem entrou

if (global.is_host) {
    // Cria o servidor
    if (server < 0) show_message("Erro: Porta ocupada ou falha ao criar servidor.");
} else {
    // Cliente tenta conectar
    conexao = network_connect(socket, global.ip_servidor, global.porta);
    if (conexao < 0) show_message("Erro: Não foi possível conectar ao Host.");
}