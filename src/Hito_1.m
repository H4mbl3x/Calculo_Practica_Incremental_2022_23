clear
clc
% --------------
% |   HITO 1   |
% --------------

% Primero defino los vectores y los datos que utilizaré para resolver el hito:

% Vector con los instantes de tiempo:
    % Para hacerlo más versátil y poder utilizar el modelo en otros casos,
    % defino los parámetros del incremento del tiempo y el tiempo total
    % como variables
incremento_tiempo = 0.1;
tiempo_total = 25;
instante_tiempo = 0:incremento_tiempo:tiempo_total;

% Cantidad de agua deseada:
agua_deseada = 0.25;

% Constante k:
k = 0.1;

% La cantidad de agua inicial en el vaso es igual a cero:
cantidad_agua_vaso(1) = 0;

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=1:length(instante_tiempo)
    
    % Discrepancia por instante de tiempo:
    discrepancia(i) = agua_deseada - cantidad_agua_vaso(i);

    % Flujo por instante de tiempo:
    flujo_grifo(i) = k * discrepancia(i);

    % Hallo la cantidad de agua del vaso a los 10 segundos:
    if instante_tiempo(i)==10
        display('La cantidad de litros de agua en el vaso en el segundo 10 es de :')
        display(cantidad_agua_vaso(i));
    % Hallo la cantidad de agua del vaso a los 20 segundos:
    elseif instante_tiempo(i)==20
        display('La cantidad de litros de agua en el vaso en el segundo 20 es de :')
        display(cantidad_agua_vaso(i));
    end

    % Cantidad de agua en el vaso en el siguiente instante de tiempo:
    cantidad_agua_vaso(i+1) = cantidad_agua_vaso(i) + flujo_grifo(i) .* incremento_tiempo;
end

% Represento gráficamente la evolución del flujo
subplot(1,2,1)
plot(instante_tiempo, flujo_grifo)
title('Flujo del Grifo')
ylabel('Litros de agua')
xlabel('Instante de Tiempo')

% Acoto el vector de la cantidad de agua en el vaso para no tener problema
% con la longitud de los vectores cantidad_agua_vaso e instante_tiempo
cantidad_agua_vaso = cantidad_agua_vaso(1:length(instante_tiempo));

% Represento gráficamente la evolución de la cantidad del agua en el vaso
subplot(1,2,2)
plot(instante_tiempo,cantidad_agua_vaso)
title('Cantidad de Agua en el Vaso')
ylabel('Litros de agua')
xlabel('Instante de Tiempo')