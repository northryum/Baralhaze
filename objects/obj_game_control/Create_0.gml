

// --- Final do Evento Create ---
mx_prev = mouse_x;
my_prev = mouse_y;

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

// ==========================================
// Gerar os objetos das cartas na mão do jogador 0
// ==========================================
var _qtd_cartas_jogador = array_length(mao_jogador[0]);
var espacamento = 80;

// Calcula a largura total da mão para centralizar o leque
var _largura_total = (_qtd_cartas_jogador - 1) * espacamento; 

// A primeira carta nasce recuada exatamente metade dessa largura
var pos_x_inicial = (room_width / 2) - (_largura_total / 2); 
var pos_y = room_height - 100;

for (var i = 0; i < _qtd_cartas_jogador; i++) {
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
opcoes_fim = ["fim_jogar", "fim_opcoes", "fim_menu"];
selecao_fim = 0;
#endregion

#region Funções Principais

function contestar_jogada(_quem_contestou) {
    if (jogo_acabou) return;
    esperando_contestacao = true; 
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
	
    show_debug_message("CONTESTAÇÃO: Mentiu? " + string(_mentiu) + " | Eliminado: " + string(_eliminado));
    
	jogador_ativo[_eliminado] = false;
    mao_jogador[_eliminado] = []; 
	// Após a eliminação, a mesa "esfria". Ninguém mais pode ser contestado.
    quem_jogou_ultimo = -1;
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

var _y_botoes = room_height - 100; 
var _cx = room_width / 2; // O eixo central da tela

// Essa variável define a distância do centro. 
// Aumente para afastar do deck, diminua para colar mais no deck.
var _afastamento = 350; 

// 1. Criar o botão de Contestar na ESQUERDA do deck
instance_create_layer(_cx - _afastamento, _y_botoes, "Instances", obj_botao_contestar);

// 2. Criar o botão de Jogar na DIREITA do deck
instance_create_layer(_cx + _afastamento, _y_botoes, "Instances", obj_botao_jogar);
// Chute inicial para o primeiro turno
if (turno_atual != 0) {
    alarm[0] = 100; 
}

global.skin_atual = 0; // 0 = Padrão, 1 = Arcade, 2 = Taverna

// Só depois de definir o valor padrão, você chama o carregamento do arquivo
carregar_configuracoes();