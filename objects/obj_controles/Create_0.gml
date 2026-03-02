// --- obj_controles: Evento Create ---
selecao_atual = 0;
espacamento = 60;

// Os rótulos das ações
menu_controles = ["Cima", "Baixo", "Esquerda", "Direita", "Confirmar", "Voltar"];

// A variável mágica: se for true, o jogo pausa o menu e espera você apertar algo
esperando_tecla = false; 

// Variáveis do mouse para o Hover funcionar perfeitamente
mx_prev = mouse_x;
my_prev = mouse_y;