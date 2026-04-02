

// 0=PT, 1=EN, 2=FR, 3=ES, 4=JP
global.idioma_atual = 0; 

// Nosso "Data Frame" de traduções
global.dicionario = {
    // Menus
    "op_audio": ["Áudio", "Audio", "Audio", "Audio", "音声"],
    "op_tela": ["Tela", "Screen", "Écran", "Pantalla", "画面"],
    "op_res": ["Resolução", "Resolution", "Résolution", "Resolución", "解像度"],
    "op_video": ["Vídeo", "Video", "Vidéo", "Video", "ビデオ"],
    "op_idioma": ["Idioma", "Language", "Langue", "Idioma", "言語"],
    "op_skins": ["Skins", "Skins", "Skins", "Capas", "スキン"],
    "op_controles": ["Controles", "Controls", "Contrôles", "Controles", "操作"],
    "op_voltar": ["Voltar", "Back", "Retour", "Volver", "戻る"],
    
    // Nomes dos Idiomas (Para mostrar na opção)
    "lang_nome": ["Português", "English", "Français", "Español", "日本語"],
    
    // Textos do Jogo
   // --- NOMES DAS CARTAS ---
    "carta_as": ["Ás (A)", "Ace (A)", "As (A)", "As (A)", "エース (A)"],
    "carta_coringa": ["Coringa (J)", "Joker (J)", "Joker (J)", "Comodín (J)", "ジョーカー (J)"],
    "carta_rainha": ["Rainha (Q)", "Queen (Q)", "Reine (Q)", "Reina (Q)", "クイーン (Q)"],
    "carta_rei": ["Rei (K)", "King (K)", "Roi (K)", "Rey (K)", "キング (K)"],

    // --- MENSAGENS DE TURNO ---
    "hud_sua_vez_acao": ["-> SUA VEZ! Jogue ou Conteste <-", "-> YOUR TURN! Play or Challenge <-", "-> À VOUS ! Jouez ou Contestez <-", "-> ¡TU TURNO! Juega o Desafía <-", "-> あなたの番！ プレイまたはダウト <-"],
	// --- ALERTAS DE TURNO (HUD) ---
    "hud_aviso_ultima": ["-> ÚLTIMA CARTA! Você é OBRIGADO a Contestar! <-", "-> LAST CARD! You are FORCED to Challenge! <-", "-> DERNIÈRE CARTE ! Vous êtes OBLIGÉ de contester ! <-", "-> ¡ÚLTIMA CARTA! ¡Estás OBLIGADO a Desafiar! <-", "-> 最後のカード！ 強制ダウトです！ <-"],
    "hud_aviso_jogue": ["-> SUA VEZ! Selecione e Jogue <-", "-> YOUR TURN! Select and Play <-", "-> À VOUS ! Sélectionnez et Jouez <-", "-> ¡TU TURNO! Selecciona y Juega <-", "-> あなたの番！ 選択してプレイ <-"],
// --- MENU PRINCIPAL ---
    "menu_modo": ["Modo de Jogo: ", "Game Mode: ", "Mode de Jeu : ", "Modo de Juego: ", "ゲームモード: "],
    "modo_solo": ["Solo", "Solo", "Solo", "Solo", "ソロ"],
 "modo_multi_online": ["Multiplayer Online", "Online Multiplayer", "Multijoueur en Ligne", "Multijugador Online", "オンラインマルチプレイ"],
    "menu_tuto": ["Como Jogar", "How to Play", "Comment Jouer", "Cómo Jugar", "遊び方"],
    "menu_config": ["Configurações", "Settings", "Paramètres", "Ajustes", "設定"],
    "c": ["Sair", "Quit", "Quitter", "Salir", "終了"],
	
	"menu_dif": ["Dificuldade: ", "Difficulty: ", "Difficulté : ", "Dificultad: ", "難易度: "],
    "dif_indisp": ["Indisponível", "Unavailable", "Indisponible", "No disponible", "利用不可"],
    "dif_facil": ["Fácil", "Easy", "Facile", "Fácil", "簡単"],
    "dif_normal": ["Normal", "Normal", "Normal", "Normal", "普通"],
    "dif_dificil": ["Difícil", "Hard", "Difficile", "Difícil", "難しい"],

    // --- SKINS ---
    "skins_titulo": ["GALERIA DE SKINS", "SKINS GALLERY", "GALERIE DE SKINS", "GALERÍA DE SKINS", "スキンギャラリー"],
    "skins_modelo": ["Modelo: < ", "Model: < ", "Modèle : < ", "Modelo: < ", "モデル: < "],
    "skins_instrucao": ["Aperte ESPAÇO para Confirmar e Voltar", "Press SPACE to Confirm and Return", "Appuyez sur ESPACE pour confirmer", "Presiona ESPACIO para confirmar", "スペースキーで確定して戻る"],

    // --- JOGO (HUD e Botões) ---
	"hud_cartas_mesa": ["CARTA DA MESA: ", "TABLE CARD: ", "CARTE DE LA TABLE : ", "CARTA DE LA MESA: ", "場のカード: "],
    "hud_cartas": ["Cartas Acumuladas: ", "Accumulated Cards: ", "Cartes Accumulées : ", "Cartas Acumuladas: ", "累積カード: "],
    "hud_btn_jogar": ["JOGAR", "PLAY", "JOUER", "JUGAR", "プレイ"],
    "hud_btn_duvido": ["CONTESTAR", "CHALLENGE", "CONTESTER", "DESAFIAR", "ダウト"],
    "hud_vez_bot": ["Vez do Bot ", "Bot's turn ", "Tour du Bot ", "Turno del Bot ", "ボットの番 "],
    "hud_pensando": [" pensando...", " thinking...", " réfléchit...", " pensando...", " 考え中..."],
    
	// --- POPUP DE CONFIRMAÇÃO ---
	"pop_aviso": ["Configurações não salvas.\nManter alterações ou reverter?", "Settings not saved.\nKeep changes or revert?", "Paramètres non enregistrés.\nConserver ou annuler ?", "Ajustes no guardados.\n¿Mantener cambios o revertir?", "設定が保存されていません。\n変更を保持しますか、元に戻しますか？"],
    "pop_manter": ["Manter Alterações", "Keep Changes", "Conserver", "Mantener", "変更を保持"],
    "pop_reverter": ["Reverter", "Revert", "Annuler", "Revertir", "元に戻す"],
	
    // --- LOBBY MULTIPLAYER ---
    "lobby_titulo": ["SALA MULTIPLAYER", "MULTIPLAYER LOBBY", "SALON MULTIJOUEUR", "SALA MULTIJUGADOR", "マルチプレイロビー"],
    "lobby_wait": ["Aguardando jogadores...", "Waiting for players...", "En attente de joueurs...", "Esperando jugadores...", "プレイヤーを待機中..."],
    "lobby_start": ["Iniciar Partida", "Start Match", "Démarrer", "Iniciar Partida", "試合開始"],
    
    // --- TUTORIAL ---
    "tuto_titulo": ["COMO JOGAR", "HOW TO PLAY", "COMMENT JOUER", "CÓMO JUGAR", "遊び方"],
	// --- TUTORIAL (Navegação) ---
    "tuto_pg_atual": ["Página ", "Page ", "Page ", "Página ", "ページ "],
    "tuto_pg_de": [" de ", " of ", " sur ", " de ", " / "],
    "tuto_rodape": ["Setas: Navegar | ESC: Voltar ao Menu", "Arrows: Navigate | ESC: Return to Menu", "Flèches : Naviguer | ESC : Retour au Menu", "Flechas: Navegar | ESC: Volver al Menú", "矢印キー: 移動 | ESC: メニューに戻る"],
    
    // Página 1: Objetivo
    "tuto_p1": [
        "BEM-VINDO AO BARALHANZE!\n\nO objetivo do jogo é simples: seja o primeiro jogador a ficar com ZERO cartas na mão.", 
        "WELCOME TO BARALHANZE!\n\nThe goal of the game is simple: be the first player to have ZERO cards in your hand.", 
        "BIENVENUE DANS BARALHANZE !\n\nLe but du jeu est simple : soyez le premier joueur à n'avoir AUCUNE carte en main.", 
        "¡BIENVENIDO A BARALHANZE!\n\nEl objetivo del juego es simple: sé el primer jugador en quedarte con CERO cartas en la mano.", 
        "Baralhanzeへようこそ！\n\nゲームの目的はシンプルです。最初に手札をゼロにしたプレイヤーの勝利です。"
    ],

    // Página 2: Jogando cartas
    "tuto_p2": [
        "COMO JOGAR\n\nNo seu turno, selecione as cartas que deseja jogar e coloque-as viradas para baixo.\nVocê deve declarar que elas correspondem ao valor que está sendo pedido.", 
        "HOW TO PLAY\n\nOn your turn, select the cards you want to play and place them face down.\nYou must declare that they match the requested value.", 
        "COMMENT JOUER\n\nÀ votre tour, sélectionnez les cartes que vous souhaitez jouer et placez-les face cachée.\nVous devez déclarer qu'elles correspondent à la valeur demandée.", 
        "CÓMO JUGAR\n\nEn tu turno, selecciona las cartas que deseas jugar y colócalas boca abajo.\nDebes declarar que coinciden con el valor solicitado.", 
        "遊び方\n\n自分の番が来たら、出したいカードを選んで裏向きに出します。\nその際、場が求めているカードの数字を宣言する必要があります。"
    ],

    // Página 3: Contestação
    "tuto_p3": [
        "CONTESTAÇÃO\n\nSe alguém achar que você está mentindo, pode clicar em CONTESTAR.\nSe você mentiu, você pega todas as cartas da mesa!\nSe falou a verdade, quem contestou pega as cartas.", 
        "CHALLENGING\n\nIf someone thinks you are lying, they can click CHALLENGE.\nIf you lied, you take all the cards on the table!\nIf you told the truth, the challenger takes the cards.", 
        "CONTESTATION\n\nSi quelqu'un pense que vous mentez, il peut cliquer sur CONTESTER.\nSi vous avez menti, vous prenez toutes les cartes de la table !\nSi vous avez dit la vérité, le contestataire prend les cartes.", 
        "DESAFÍO\n\nSi alguien cree que estás mintiendo, puede hacer clic en DESAFIAR.\nSi mentiste, ¡te llevas todas las cartas de la mesa!\nSi dijiste la verdad, quien desafió se lleva las cartas.", 
        "ダウト（異議）\n\n嘘をついていると思ったら、「ダウト」をクリックできます。\n嘘だった場合、出した人は場のカードをすべて引き取ります！\n本当だった場合、ダウトをかけた人がカードを引き取ります。"
    ],

    // Página 4: O Blefe e o Coringa
    "tuto_p4": [
        "A ARTE DO BLEFE\n\nVocê NÃO precisa jogar a carta que a mesa pede!\nVocê pode blefar escondendo outras cartas.\nLembrando: O Coringa (J) vale como qualquer carta e nunca é considerado mentira.", 
        "THE ART OF BLUFFING\n\nYou DO NOT need to play the requested card!\nYou can bluff by hiding other cards.\nRemember: The Joker (J) counts as any card and is never a lie.", 
        "L'ART DU BLUFF\n\nVous n'êtes PAS obligé de jouer la carte demandée !\nVous pouvez bluffer en cachant d'autres cartes.\nRappel : Le Joker (J) remplace n'importe quelle carte et n'est jamais un mensonge.", 
        "EL ARTE DE FAROLEAR\n\n¡NO necesitas jugar la carta que pide la mesa!\nPuedes farolear escondiendo otras cartas.\nRecuerda: El Comodín (J) vale por cualquier carta y nunca es mentira.", 
        "ブラフの技術\n\n要求されたカードを出す必要はありません！\n他のカードを隠してブラフすることができます。\n注意: ジョーカー(J)はどのカードの代わりにもなり、嘘にはなりません。"
    ],

    // Página 5: Fim de Jogo (A trava que fizemos antes)
    "tuto_p5": [
        "FIM DE JOGO\n\nO jogo não acaba no momento em que você joga sua última carta.\nO próximo jogador é OBRIGADO a contestar a sua última jogada.\nSe você não mentiu, você VENCE a partida!", 
        "GAME OVER\n\nThe game doesn't end the moment you play your last card.\nThe next player is FORCED to challenge your last play.\nIf you didn't lie, you WIN the match!", 
        "FIN DU JEU\n\nLe jeu ne se termine pas au moment où vous jouez votre dernière carte.\nLe joueur suivant est OBLIGÉ de contester votre dernier coup.\nSi vous n'avez pas menti, vous GAGNEZ la partie !", 
        "FIN DEL JUEGO\n\nEl juego no termina en el momento en que juegas tu última carta.\nEl siguiente jugador está OBLIGADO a desafiar tu última jugada.\nSi no mentiste, ¡GANAS la partida!", 
        "ゲーム終了\n\n最後のカードを出した瞬間にゲームが終わるわけではありません。\n次のプレイヤーは強制的にあなたの最後のプレイにダウトをかけなければなりません。\n嘘をついていなければ、あなたの勝利です！"
    ],
	
	// --- TELA DE FIM DE JOGO ---
    "fim_titulo": ["FIM DE JOGO", "GAME OVER", "FIN DU JEU", "FIN DEL JUEGO", "ゲーム終了"],
    "fim_venceu_voce": ["VOCÊ VENCEU!", "YOU WIN!", "VOUS GAGNEZ !", "¡TÚ GANAS!", "あなたの勝利！"],
    "fim_venceu_bot": [" VENCEU!", " WINS!", " GAGNE !", " ¡GANA!", " の勝利！"],
    
    "fim_jogar": ["Jogar Novamente", "Play Again", "Rejouer", "Jugar de Nuevo", "もう一度プレイ"],
    "fim_opcoes": ["Opções", "Options", "Options", "Opciones", "オプション"],
    "fim_menu": ["Menu Principal", "Main Menu", "Menu Principal", "Menú Principal", "メインメニュー"]
};
//if (global.idioma_atual == 4) draw_set_font(Font_jp); else draw_set_font(Font_geral);
// Função Tradutora
function tr(_chave) {
    // Checa se a chave existe no nosso dicionário
    if (variable_struct_exists(global.dicionario, _chave)) {
        // Retorna o texto na posição do idioma atual
        return global.dicionario[$ _chave][global.idioma_atual];
    }
    return _chave; // Se esquecer de traduzir algo, ele mostra a própria chave para não dar erro
}