esperando_contestacao = false; // Se for true, ninguém pode jogar ou pensar

#region Criando o Baralho (Setup)
// 0=A, 1=J(Coringa), 2=Q, 3=K
baralho = [0,0,0,0,0,0, 2,2,2,2,2,2, 3,3,3,3,3,3, 1,1]; 

// Embaralhar
randomize();
array_shuffle_ext(baralho);

// Mãos dos 4 jogadores e Controle de Atividade
mao_jogador = [[], [], [], []];
jogador_ativo = [true, true, true, true];

// Distribuir 5 cartas para cada um
var _carta_index = 0;
for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 5; j++) {
        array_push(mao_jogador[i], baralho[_carta_index]);
        _carta_index++;
    }
}

// Variáveis de Controle Visual e Estatística
quem_contestou_visual = -1;
cartas_reveladas = [0, 0, 0, 0]; 

// Gerar os objetos das cartas na mão do jogador 0
var pos_x_inicial = room_width / 2 - 150; 
var pos_y = room_height - 100;
var espacamento = 80;

for (var i = 0; i < array_length(mao_jogador[0]); i++) {
    var nova_carta = instance_create_layer(pos_x_inicial + (i * espacamento), pos_y, "Instances", obj_carta);
    nova_carta.valor = mao_jogador[0][i];
    nova_carta.y_original = pos_y;
}
#endregion

#region Definição da Rodada e Turno
// Sorteia o objetivo: 0(A), 2(Q) ou 3(K)
carta_objetivo = choose(0, 2, 3); 

// Sorteia quem começa (0 a 3)
turno_atual = irandom(3);

// Lógica de Pilha
pilha_mesa = []; 
ultimas_cartas_jogadas = []; 
quem_jogou_ultimo = -1;
jogo_acabou = false;
nome_vencedor = "";

// Menu da tela de vitória
opcoes_fim = ["Jogar Novamente", "Opções", "Menu Principal"];
selecao_fim = 0;
#endregion

#region Funções Principais

function contestar_jogada(_quem_contestou) {
    if (jogo_acabou) return;
    esperando_contestacao = true; // ATIVA A TRAVA
    alarm[0] = -1; 
    quem_contestou_visual = _quem_contestou; 
    var _mentiu = false;
    
    // ANALISE ESTATÍSTICA DA JOGADA
    for (var i = 0; i < array_length(ultimas_cartas_jogadas); i++) {
        var _c = ultimas_cartas_jogadas[i];
        
        // REGRA DO CORINGA: 
        // Se a carta NÃO for o objetivo E NÃO for o Coringa (valor 1), então é mentira.
        // Se for Coringa (1), a condição abaixo será Falsa, e _mentiu continuará false.
        if (_c != carta_objetivo && _c != 1) { 
            _mentiu = true;
            break; 
        }
    }

    // Se _mentiu for false aqui, significa que todas as cartas eram ou o Objetivo ou Valetes (Coringas).

    var _eliminado = (_mentiu) ? quem_jogou_ultimo : _quem_contestou;
    
    jogador_ativo[_eliminado] = false;
    mao_jogador[_eliminado] = []; 
    
    show_debug_message("CONTESTAÇÃO: Mentiu? " + string(_mentiu) + " | Eliminado: " + string(_eliminado));
    
    with (obj_carta_mesa) {
        virada_para_baixo = false;
        obj_game_control.cartas_reveladas[valor]++;
    }

    array_delete(ultimas_cartas_jogadas, 0, array_length(ultimas_cartas_jogadas));
    alarm[1] = 180; 
}

function passar_turno() {
   if (jogo_acabou || esperando_contestacao) return; // TRAVA AQUIurn;
    
    // Previne que bots joguem fora de hora
    alarm[0] = -1; 

    // Avança o turno circularmente
    turno_atual++;
    if (turno_atual > 3) turno_atual = 0;
    
    // Pula jogadores eliminados
    if (jogador_ativo[turno_atual] == false) {
        return passar_turno(); 
    }
    
    show_debug_message(">>> VEZ CONFIRMADA: Jogador " + string(turno_atual));

    // Se for bot, ativa o cérebro após uma pausa
    if (turno_atual != 0) {
        alarm[0] = 120; 
    }
}
#endregion

// Criar botões de Interface
instance_create_layer(room_width - 150, room_height - 100, "Instances", obj_botao_jogar);
instance_create_layer(room_width - 150, room_height - 160, "Instances", obj_botao_contestar);

// Chute inicial para o primeiro turno
if (turno_atual != 0) {
    alarm[0] = 100; 
}