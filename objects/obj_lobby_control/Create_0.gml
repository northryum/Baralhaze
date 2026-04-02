// --- obj_lobby_control: Evento Create ---
opcoes = ["Criar Partida", "Entrar em Partida", "Opções", "Voltar ao Menu"];
selecao_atual = 0;
espacamento = 60;
// 0 = Pública, 1 = Privada
tipo_partida = 0; 

// Variáveis para rastrear o mouse (igual fizemos nos outros menus)
mx_prev = mouse_x;
my_prev = mouse_y;


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