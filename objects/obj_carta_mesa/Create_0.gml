valor = 0;
virada_para_baixo = true;

// Define PARA ONDE a carta vai voar (o centro da tela com um leve desvio)
target_x = (room_width / 2) + irandom_range(-20, 20);
target_y = (room_height / 2) + irandom_range(-20, 20);
target_angle = irandom_range(-25, 25);

image_angle = 0; // Começa reta