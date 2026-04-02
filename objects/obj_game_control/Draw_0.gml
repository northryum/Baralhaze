draw_self();
draw_set_font(Font_geral);
draw_set_color(c_white);

// --- MUDANÇA AQUI: Alinhando o texto pela esquerda ---
draw_set_halign(fa_left);

var _x_hud = 30; // Margem fixa no canto esquerdo

// 1. Carta Alvo e Mesa
var _nomes_cartas = [tr("carta_as"), tr("carta_coringa"), tr("carta_rainha"), tr("carta_rei")];
var _nome_alvo = _nomes_cartas[carta_objetivo];

// Trocamos o (room_width / 2) por _x_hud
draw_text(_x_hud, 30, tr("hud_cartas_mesa") + _nome_alvo);
draw_text(_x_hud, 60, tr("hud_cartas") + string(array_length(pilha_mesa)));

// 2. Legenda do Turno Inteligente (Correção)
if (turno_atual == 0) {
    // Checa se o último cara zerou a mão
    var _forcar = false;
    if (quem_jogou_ultimo != -1 && array_length(mao_jogador[quem_jogou_ultimo]) == 0) {
        _forcar = true;
    }
    
    if (_forcar) {
        draw_set_color(c_red); // Fica vermelho pra dar o alerta de urgência!
draw_text(_x_hud, 90, tr("hud_aviso_ultima"));
    } 
    else {
        draw_set_color(c_yellow);
        if (array_length(ultimas_cartas_jogadas) == 0) {
            draw_text(_x_hud, 90,tr("hud_aviso_jogue"));
        } else {
draw_text(_x_hud, 90, tr("hud_sua_vez_acao"));
        }
    }
} else {
    draw_set_color(c_ltgray);
draw_text(_x_hud, 90, tr("hud_vez_bot") + string(turno_atual) + tr("hud_pensando"));
}

// Reseta a cor e o alinhamento para não "vazar" para os próximos desenhos
draw_set_color(c_white);
draw_set_halign(fa_left);


// --- NOVO: INDICADOR DE TURNO VISUAL ---
//draw_set_color(c_yellow);
//if (turno_atual == 1) draw_rectangle(30, (room_height/2) - 30, 110, (room_height/2) + 150, true); // Bot 1 (Esq)
//if (turno_atual == 2) draw_rectangle((room_width/2) - 30, 130, (room_width/2) + 150, 230, true); // Bot 2 (Cima)
//if (turno_atual == 3) draw_rectangle(room_width - 110, (room_height/2) - 30, room_width - 30, (room_height/2) + 150, true); // Bot 3 (Dir)
//if (turno_atual == 0) draw_rectangle((room_width/2) - 200, room_height - 120, (room_width/2) + 200, room_height - 20, true); // Você (Baixo)
//draw_set_color(c_white);


// 3. DESENHAR AS CARTAS DOS BOTS (Visual)
// O frame 4 é o verso da carta que você criou
var _sprite_atual = get_sprite_skin();
var _frame_verso = 0; 
var _espacamento = 25; // As cartas ficam mais juntinhas na mão dos bots

// Bot 1 (Esquerda)
if (jogador_ativo[1]) {
    var _qtd = array_length(mao_jogador[1]);
    var _altura_total = (_qtd - 1) * _espacamento;
    var _y_inicial = (room_height / 2) - (_altura_total / 2); // Centraliza no eixo Y
    
    for (var i = 0; i < _qtd; i++) {
        draw_sprite_ext(_sprite_atual, _frame_verso, 50, _y_inicial + (i * _espacamento), 1, 1, 270, c_white, 1);
    }
}

// Bot 2 (Cima) ---- arrumar
if (jogador_ativo[2]) {
    for (var i = 0; i < array_length(mao_jogador[2]); i++) {
        draw_sprite(_sprite_atual, _frame_verso, (room_width/2) + (i * _espacamento)-50, 100);
    }
}

/*
if (jogador_ativo[2]) {
    var _qtd = array_length(mao_jogador[2]);
    var _largura_total = (_qtd - 1) * _espacamento;
    var _x_inicial = (room_width / 2) - (_largura_total / 2); // Centraliza no eixo X
    
    for (var i = 0; i < _qtd; i++) {
        // Usa o draw_sprite_ext para garantir consistência de parâmetros, ângulo 0 (normal)
        draw_sprite_ext(spr_cartas, _frame_verso, _x_inicial + (i * _espacamento), 50, 1, 1, 0, c_white, 1);
    }
}
*/


// Bot 3 (Direita)
if (jogador_ativo[3]) {
    var _qtd = array_length(mao_jogador[3]);
    var _altura_total = (_qtd - 1) * _espacamento;
    var _y_inicial = (room_height / 2) - (_altura_total / 2); // Centraliza no eixo Y
    
    for (var i = 0; i < _qtd; i++) {
        draw_sprite_ext(_sprite_atual, _frame_verso, room_width - 50, _y_inicial + (i * _espacamento), 1, 1, 90, c_white, 1);
    }
}

// ==========================================
// EFEITO VISUAL DE CONTESTAÇÃO
// ==========================================
if (quem_contestou_visual != -1) {
    draw_set_color(c_red);
    draw_set_alpha(0.6); // Meio transparente para não cobrir tudo
    
    var _txt = tr("hud_btn_duvido");
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Desenha a barra no canto correspondente ao jogador
    if (quem_contestou_visual == 0) { // Você (Baixo)
        draw_rectangle(0, room_height - 60, room_width, room_height, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text_transformed(room_width/2, room_height - 30, _txt, 1.5, 1.5, 0);
        
    } else if (quem_contestou_visual == 1) { // Bot 1 (Esquerda)
        draw_rectangle(0, 0, 60, room_height, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text_transformed(30, room_height/2, _txt, 1.5, 1.5, 90); // Texto de lado
        
    } else if (quem_contestou_visual == 2) { // Bot 2 (Cima)
        draw_rectangle(0, 0, room_width, 60, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text_transformed(room_width/2, 30, _txt, 1.5, 1.5, 0);
        
    } else if (quem_contestou_visual == 3) { // Bot 3 (Direita)
        draw_rectangle(room_width - 60, 0, room_width, room_height, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text_transformed(room_width - 30, room_height/2, _txt, 1.5, 1.5, -90); // Texto de lado
    }
    
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

/*/ 1. Configurações de fonte e cor
draw_set_color(c_white);
draw_set_halign(fa_center); // Centraliza o texto horizontalmente

// 2. Descobrir o nome da carta alvo da rodada
var _nome_alvo = "";
if (carta_objetivo == 0) _nome_alvo = "Ás (A)";
if (carta_objetivo == 2) _nome_alvo = "Rainha (Q)";
if (carta_objetivo == 3) _nome_alvo = "Rei (K)";

// 3. Desenhar informações no topo da tela
draw_text(room_width / 2, 30, "CARTA DA MESA: " + _nome_alvo);
draw_text(room_width / 2, 60, "Cartas Acumuladas: " + string(array_length(pilha_mesa)));

// 4. Mostrar de quem é a vez com destaque
if (turno_atual == 0) {
    draw_set_color(c_yellow);
    draw_text(room_width / 2, 90, "-> SUA VEZ! Jogue ou Conteste <-");
} else {
    draw_set_color(c_ltgray);
    draw_text(room_width / 2, 90, "Vez do Bot " + string(turno_atual) + " pensando...");
}
draw_set_color(c_white); // Reseta a cor para branco

// 5. Desenhar o status dos Bots no canto esquerdo
draw_set_halign(fa_left); // Alinha o texto à esquerda
var _pos_y_bots = 150;

for (var i = 1; i <= 3; i++) {
    if (jogador_ativo[i] == true) {
        // Mostra quantas cartas o bot ainda tem
        draw_text(30, _pos_y_bots + (i * 40), "Bot " + string(i) + ": " + string(array_length(mao_jogador[i])) + " cartas");
    } else {
        // Destaca em vermelho se o bot foi eliminado
        draw_set_color(c_red);
        draw_text(30, _pos_y_bots + (i * 40), "Bot " + string(i) + ": ELIMINADO");
        draw_set_color(c_white);
    }
}

// 6. Mostrar o status do Jogador (Você) no canto esquerdo
if (jogador_ativo[0] == true) {
    draw_set_color(c_aqua);
    draw_text(30, _pos_y_bots + 160, "Você: " + string(array_length(mao_jogador[0])) + " cartas");
} else {
    draw_set_color(c_red);
    draw_text(30, _pos_y_bots + 160, "Você: ELIMINADO");
}
draw_set_color(c_white);



// TELA DE GAME OVER
if (jogo_acabou == true) {
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, room_width, room_height, false); // Escurece o fundo
    
    draw_set_alpha(1);
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    
    draw_text_transformed(room_width/2, room_height/2 - 50, "FIM DE JOGO", 2, 2, 0);
    draw_set_color(c_white);
    draw_text_transformed(room_width/2, room_height/2, nome_vencedor, 1.5, 1.5, 0);
}
*/


// TELA DE GAME OVER E MENU
if (jogo_acabou == true) {
    draw_set_color(c_black);
    draw_set_alpha(0.85); // Deixa o fundo bem escurinho
    draw_rectangle(0, 0, room_width, room_height, false);
    
    draw_set_alpha(1);
    
    // Título FIM DE JOGO
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
   draw_text_transformed(room_width/2, room_height/2 - 100, tr("fim_titulo"), 2, 2, 0);// Ajuste o x, y e escalas pro seu código
    
    // Nome do Vencedor
    draw_set_color(c_white);
    var _txt_vencedor = "";
    
    // Usa a variável 'vencedor_final' que salvamos no Step
    if (vencedor_final == 0) {
        _txt_vencedor = tr("fim_venceu_voce");
    } else {
        _txt_vencedor = "BOT " + string(vencedor_final) + tr("fim_venceu_bot");
    }
    
draw_text_transformed(room_width/2, room_height/2 - 50, _txt_vencedor, 1.5, 1.5, 0);

    // =========================================
    // DESENHAR OPÇÕES DO MENU DE FIM DE JOGO
    // =========================================
    draw_set_valign(fa_middle);
    var _espaco = 50; 
    for (var i = 0; i < array_length(opcoes_fim); i++) {
        var _y_item = (room_height / 2) + 30 + (i * _espaco); 
        
        // Traduz as chaves do array dinamicamente
        var _texto = tr(opcoes_fim[i]); 
        
        if (i == selecao_fim) draw_set_color(c_yellow); else draw_set_color(c_white);
        
        var _txt_desenho = (i == selecao_fim) ? "> " + _texto + " <" : _texto;
        draw_text_transformed(room_width/2, _y_item, _txt_desenho, 1.2, 1.2, 0);
    }
}