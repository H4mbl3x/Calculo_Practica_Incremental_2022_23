clear
clc
% --------------
% |   HITO 2   |
% --------------

% Primero defino los vectores y los datos que utilizaré para resolver el hito:

% Vector con los instantes de tiempo:
    % Para hacerlo más versátil y poder utilizar el modelo en otros casos,
    % defino los parámetros del incremento del tiempo y el tiempo total
    % como variables
incremento_tiempo = 1;
tiempo_total = 50;
instante_tiempo = 0:incremento_tiempo:tiempo_total;

% Vector con la población susceptible en el momento inicial igual a 1000:
problacion_susceptible(1) = 1000;

% Vector con la población enferma en el momento inicial igual a 0:
problacion_enferma(1) = 0;

% Valor de la incidencia constante
valor_incidencia(1) = 50;

% Valor de la incidencia inicial
incidencia(1) = 50;

%Valor de la prevalencia inicial
prevalencia(1) = problacion_enferma(1) ./ ( problacion_enferma(1) + problacion_susceptible(1) );

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector de la incidencia controlando que sea menor a la poblacion susceptible:
    control_incidencia = [valor_incidencia(1) problacion_susceptible(i-1)];
    incidencia(i) = min(control_incidencia);

    % Vector con la población susceptible:
    problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia(i);

    % Vector con la población enferma:
    problacion_enferma(i) = problacion_enferma(i-1) + incidencia(i);

    % Vector con el valor de la prevalencia:
    prevalencia(i) = problacion_enferma(i) ./ ( problacion_enferma(i) + problacion_susceptible(i) );
end

% Represento gráficamente la incidencia
subplot(2,3,1)
plot(instante_tiempo, incidencia, "b")
title('Incidencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la prevalencia
subplot(2,3,2)
plot(instante_tiempo, prevalencia, "b")
title('Prevalencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la población enfermas y la población susceptibles
subplot(2,3,3)
hold on
plot(instante_tiempo, problacion_enferma, "r")
plot(instante_tiempo, problacion_susceptible, "b")
title('Población Enferma y Susceptible')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
hold off
legend('Población Enferma', 'Población Susceptible')





% Valor de incidencia menor de 50

% Retomo los datos
problacion_susceptible_menor_que_50(1) = 1000;
problacion_enferma_menor_que_50(1) = 0;
valor_incidencia_menor_que_50(1) = 25;
incidencia_menor_que_50(1) = 25;

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector de la incidencia controlando que sea menor a la poblacion susceptible:
    control_incidencia_menor_que_50 = [valor_incidencia_menor_que_50(1) problacion_susceptible_menor_que_50(i-1)];
    incidencia_menor_que_50(i) = min(control_incidencia_menor_que_50);

    % Vector con la población susceptible:
    problacion_susceptible_menor_que_50(i) = problacion_susceptible_menor_que_50(i-1) - incidencia_menor_que_50(i);
end



% Valor de incidencia mayor que 50

% Retomo los datos
problacion_susceptible_mayor_que_50(1) = 1000;
problacion_enferma_mayor_que_50(1) = 0;
valor_incidencia_mayor_que_50(1) = 75;
incidencia_mayor_que_50(1) = 75;

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector de la incidencia controlando que sea menor a la poblacion susceptible:
    control_incidencia_mayor_que_50 = [valor_incidencia_mayor_que_50(1) problacion_susceptible_mayor_que_50(i-1)];
    incidencia_mayor_que_50(i) = min(control_incidencia_mayor_que_50);

    % Vector con la población susceptible:
    problacion_susceptible_mayor_que_50(i) = problacion_susceptible_mayor_que_50(i-1) - incidencia_mayor_que_50(i);
end

% Comparo gráficamente las incidencias
subplot(2,3,4)
hold on
plot(instante_tiempo, incidencia, "b")
plot(instante_tiempo, incidencia_menor_que_50, "g")
plot(instante_tiempo, incidencia_mayor_que_50, "m")
hold off
title('Comparación de Incidencias')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
legend('Incidencia Primer Caso','Incidencia Menor que 50','Incidencia Mayor que 50')





% Población Enferma inicial igual a 100

% Retomo los datos
problacion_susceptible(1) = 900;
problacion_enferma(1) = 100;
valor_incidencia_inicial(1) = 50;
incidencia_inicial(1) = 50;
prevalencia(1) = problacion_enferma(1) ./ ( problacion_enferma(1) + problacion_susceptible(1) );

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector de la incidencia controlando que sea menor a la poblacion susceptible:
    control_incidencia_inicial = [valor_incidencia_inicial(1) problacion_susceptible(i-1)];
    incidencia_inicial(i) = min(control_incidencia_inicial);

    % Vector con la población susceptible:
    problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia_inicial(i);
end

% Represento gráficamente la incidencia y la comparo con el primer caso
subplot(2,3,5)
hold on
plot(instante_tiempo, incidencia, "b")
plot(instante_tiempo, incidencia_inicial, "k")
hold off
title('Incidencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
legend('Incidencia Primer caso','Incidencia Caso Actual')