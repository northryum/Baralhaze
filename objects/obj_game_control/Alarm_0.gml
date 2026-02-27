
if (jogo_acabou || esperando_contestacao) { 
    alarm[0] = -1; 
    exit; 
}  

var _bot_id = turno_atual;
var _mao_bot = mao_jogador[_bot_id]; 
var _decidiu_contestar = false;
var _chance_contestar = 0; // Começa em 0 e muda conforme a dificuldade

// ==========================================================
// 1. LÓGICA DE INTELIGÊNCIA (IA) - CÁLCULO DA CHANCE
// ==========================================================
if (array_length(ultimas_cartas_jogadas) > 0) {
    
    switch (global.dificuldade) {
        case 0: // FÁCIL: Puramente aleatório
            _chance_contestar = 20; 
            break;

        case 1: // NORMAL: Baseado no volume de cartas jogadas
            // Se o jogador jogou 1 carta: 10 + 15 = 25%
            // Se o jogador jogou 3 cartas: 10 + 45 = 55%
            _chance_contestar = 10 + (array_length(ultimas_cartas_jogadas) * 15);
            break;

        case 2: // DIFÍCIL: Estatística e Contagem (O modo "Graduado")
            var _conhecidas = cartas_reveladas[carta_objetivo];
            // Soma as que o bot tem na mão
            for (var i = 0; i < array_length(_mao_bot); i++) {
                if (_mao_bot[i] == carta_objetivo) _conhecidas++;
            }
            
            // Se o total conhecido + o que foi jogado na mesa > 6 (Total de cartas do tipo + Coringas)
            // ele sabe que há mentira com quase 100% de certeza.
            var _total_suspeito = _conhecidas + array_length(ultimas_cartas_jogadas);
            if (_total_suspeito > 6) _chance_contestar = 95; 
            else if (_total_suspeito >= 4) _chance_contestar = 60;
            else _chance_contestar = 10;
            break;
    }

    // Realiza o sorteio baseado na chance calculada acima
    if (irandom(100) < _chance_contestar) {
        _decidiu_contestar = true;
    }
}

// ==========================================================
// 2. EXECUÇÃO DA AÇÃO (CONTESTAR OU JOGAR)
// ==========================================================
if (_decidiu_contestar) {
    show_debug_message("Bot " + string(_bot_id) + " CONTESTOU com " + string(_chance_contestar) + "% de certeza!");
    contestar_jogada(_bot_id);
    // Nota: O passar_turno() NÃO vai aqui, ele fica no Alarm 1 da contestação
} 
else {
    // BOT DECIDIU JOGAR CARTAS
    
    // LIMPEZA VISUAL: Remove cartas da jogada anterior para não acumular
    with (obj_carta_mesa) { instance_destroy(); }
    
    // Limpa a memória das últimas cartas para a nova jogada
    array_delete(ultimas_cartas_jogadas, 0, array_length(ultimas_cartas_jogadas));

    // Determina quantas cartas o bot vai jogar (IA de volume)
    var _quantidade_para_jogar = 1;
    if (global.dificuldade > 0 && array_length(_mao_bot) > 3) {
        var _sorteio = irandom(100);
        if (_sorteio > 85) _quantidade_para_jogar = 3;
        else if (_sorteio > 70) _quantidade_para_jogar = 2;
    }
    _quantidade_para_jogar = clamp(_quantidade_para_jogar, 1, array_length(_mao_bot));

    // Define posição de origem visual
    var _sx = room_width / 2;
    var _sy = room_height / 2;
    if (_bot_id == 1) { _sx = 50; _sy = room_height / 2; }
    if (_bot_id == 2) { _sx = room_width / 2; _sy = 150; }
    if (_bot_id == 3) { _sx = room_width - 50; _sy = room_height / 2; }

    // Loop para jogar a quantidade sorteada
    repeat(_quantidade_para_jogar) {
        // Pega a primeira carta da mão dele
        var _carta = _mao_bot[0];
        
        array_push(pilha_mesa, _carta);
        array_push(ultimas_cartas_jogadas, _carta);
        
        // Cria o objeto visual na mesa
        var _visual = instance_create_layer(_sx + irandom_range(-15, 15), _sy + irandom_range(-15, 15), "Instances", obj_carta_mesa);
        _visual.valor = _carta;
        
        // Remove da mão real
        array_delete(mao_jogador[_bot_id], 0, 1);
    }

    quem_jogou_ultimo = _bot_id;
    show_debug_message("Bot " + string(_bot_id) + " jogou " + string(_quantidade_para_jogar) + " cartas.");
    
    passar_turno();
}