// --- obj_game_control: Alarm 1 ---
with (obj_carta_mesa) { instance_destroy(); }

// ==========================================
// ESCUDO DE SEGURANÇA AQUI
// ==========================================
if (array_length(ultimas_cartas_jogadas) > 0) {
    array_delete(ultimas_cartas_jogadas, 0, array_length(ultimas_cartas_jogadas));
}

esperando_contestacao = false; // LIBERA O JOGO SÓ AGORA

// Define que o próximo turno é após quem contestou
turno_atual = quem_contestou_visual;
quem_contestou_visual = -1;

passar_turno();