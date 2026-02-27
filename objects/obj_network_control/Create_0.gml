// --- obj_network_control: Create ---
socket = network_create_socket(network_socket_tcp);
lista_clientes = ds_list_create();
server = -1;
conexao = -1;

// Certifique-se de que a caixa "Persistent" está marcada no objeto!