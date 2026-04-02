carregar_configuracoes();
// Adicione isso no final do Evento Create do obj_menu E do obj_opcoes
mx_prev = mouse_x;
my_prev = mouse_y;
// Nossa coluna de opções
opcoes = ["Modo de Jogo: ", "Dificuldade: ", "Tutorial", "Configurações", "Sair do Jogo"];

// Qual opção está selecionada no momento (0 é a primeira)
selecao_atual = 0;

// Espaço entre uma frase e outra na tela
espacamento = 60;

// Variáveis de controle das dificuldades
global.dificuldade = 1; 
texto_dificuldade = ["Fácil", "Normal", "Difícil"];

// Variáveis de controle dos modos
modo_atual = 0; // 0 = Solo (Bots), 1 = Multiplayer
texto_modo = ["Solo (Bots)", "Multiplayer Online"];

global.sala_anterior = room; // O padrão é o menu principal