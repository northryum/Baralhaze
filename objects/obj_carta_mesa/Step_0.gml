// A função lerp move 10% da distância a cada frame, criando um deslize suave!
x = lerp(x, target_x, 0.1);
y = lerp(y, target_y, 0.1);
image_angle = lerp(image_angle, target_angle, 0.1);