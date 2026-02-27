// Captura os dados que chegaram
var _type = ds_map_find_value(async_load, "type");

switch (_type) {
    case network_type_connect: // Um cliente conectou (roda apenas no Host)
        var _id = ds_map_find_value(async_load, "socket");
        ds_list_add(lista_clientes, _id);
        show_debug_message("Novo jogador conectado: " + string(_id));
        break;

    case network_type_data: // Chegou uma mensagem (Carta jogada, turno, etc)
        var _buffer = ds_map_find_value(async_load, "buffer");
        ler_pacote_dados(_buffer); // Função que vamos criar para processar a jogada
        break;
}