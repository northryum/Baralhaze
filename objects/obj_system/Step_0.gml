// --- Evento Step de um Objeto Persistente ---

// Verifica se segurou ALT e apertou ENTER
if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)) {
    // Alterna os modos de tela (0 -> 1 -> 2 -> volta pro 0)
    global.tela_modo++;
    if (global.tela_modo > 2) global.tela_modo = 0;
    
    aplicar_tela();
    salvar_configuracoes(); // Salva a preferência na hora
}