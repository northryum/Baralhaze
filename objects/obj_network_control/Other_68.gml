var _type = ds_map_find_value(async_load, "type");

if (global.is_host && _type == network_type_connect) {
    var _semente = irandom(999999); // Use irandom em vez de randomize() aqui
    random_set_seed(_semente);
    
    var _buf = buffer_create(16, buffer_grow, 1);
    buffer_write(_buf, buffer_u8, msg.dados_partida);
    buffer_write(_buf, buffer_u32, _semente);
    buffer_write(_buf, buffer_u8, global.carta_objetivo);
    
    enviar_pacote(_buf); // Chamada correta
    buffer_delete(_buf);
}

if (_type == network_type_data) {
    var _buffer = ds_map_find_value(async_load, "buffer");
    ler_pacote_dados(_buffer); // Chama a função do script
}