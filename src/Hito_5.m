clear
clc
% --------------
% |   HITO 5   |
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
problacion_susceptible(1) = 990;

% Vector con la población enferma en el momento inicial igual a 0:
problacion_enferma(1) = 10;

%Valor de la prevalencia inicial
prevalencia(1) = problacion_enferma(1) ./ ( problacion_enferma(1) + problacion_susceptible(1) );

% Valor de la Tasa de Contagio
tasa_contagio = 0.5;

% Valor de la Tasa de Incidencia
tasa_incidencia(1) = tasa_contagio .* prevalencia(1);

% Valor de la incidencia inicial
incidencia(1) = tasa_incidencia(1) .* problacion_susceptible(1);

% Duración Media de la Enfermedad
duracion = 4;

% Tasa de Letaidad de la Enfermedad
letalidad = 0;

% Fórmula para los fallecimientos
% fallecidos = ( problacion_susceptible(i-(duracion+1)) - problacion_susceptible(i-duracion)) .* letalidad

% Fórmula para los curados:
% curados(i) = ( población_suceptible(i-(duracion+1)) -
% población_suceptible(i-duracion)) - fallecidos

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Valor de la Tasa de Incidencia
    tasa_incidencia(i) = tasa_contagio .* prevalencia(i-1);

    % Vector con la incidencia según la poblacion susceptible
    incidencia(i) = tasa_incidencia(i) .* problacion_susceptible(i-1);

    if i>5
        fallecidos(i) = ( problacion_susceptible(i-(duracion+1)) - problacion_susceptible(i-duracion)) .* letalidad;
        curados(i) = ( problacion_susceptible(i-(duracion+1)) - problacion_susceptible(i-duracion)) - fallecidos(i);
    end

    % Vector con la población susceptible:
    if i>5
        problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia(i-1) + curados(i);
    else
        problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia(i-1);
    end
    
    % Vector con la población enferma:
    problacion_enferma(i) = problacion_enferma(i-1) + incidencia(i-1);
    
    % Vector con el valor de la prevalencia:
    prevalencia(i) = problacion_enferma(i) ./ ( problacion_enferma(i) + problacion_susceptible(i) );
end

% Represento gráficamente la población enfermas y la población susceptibles
subplot(2,3,1)
hold on
plot(instante_tiempo, problacion_enferma, "r")
plot(instante_tiempo, problacion_susceptible, "b")
title('Población Enferma y Susceptible')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
hold off
legend('Población Enferma', 'Población Susceptible')

% Represento gráficamente la curación e incidencia
subplot(2,3,2)
hold on
plot(instante_tiempo, curados, 'g')
plot(instante_tiempo, incidencia, "b")
hold off
title('Curación e Incidencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
legend('Curados','Incidencia')

% Represento gráficamente la prevalencia
subplot(2,3,3)
plot(instante_tiempo, prevalencia, "b")
title('Prevalencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')







% Retomo los datos
incremento_tiempo = 1;
tiempo_total_2 = 100;
instante_tiempo_2 = 0:incremento_tiempo:tiempo_total_2;
problacion_susceptible_2(1) = 990;
problacion_enferma_2(1) = 10;
prevalencia_2(1) = problacion_enferma_2(1) ./ ( problacion_enferma_2(1) + problacion_susceptible_2(1) );
tasa_contagio_2 = 0.5;
tasa_incidencia_2(1) = tasa_contagio_2 .* prevalencia_2(1);
incidencia_2(1) = tasa_incidencia_2(1) .* problacion_susceptible_2(1);
duracion_2 = 4;
letalidad_2 = 0.1;

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo_2)

    % Valor de la Tasa de Incidencia
    tasa_incidencia_2(i) = tasa_contagio_2 .* prevalencia_2(i-1);

    % Vector con la incidencia según la poblacion susceptible
    incidencia_2(i) = tasa_incidencia_2(i) .* problacion_susceptible_2(i-1);

    if i>5
        fallecidos_2(i) = ( problacion_susceptible_2(i-(duracion_2+1)) - problacion_susceptible_2(i-duracion_2)) .* letalidad_2;
        curados_2(i) = ( problacion_susceptible_2(i-(duracion_2+1)) - problacion_susceptible_2(i-duracion_2)) - fallecidos_2(i);
    end

    % Vector con la población susceptible:
    if i>5
        problacion_susceptible_2(i) = problacion_susceptible_2(i-1) - incidencia_2(i-1) + curados_2(i);
    else
        problacion_susceptible_2(i) = problacion_susceptible_2(i-1) - incidencia_2(i-1);
    end
    
    % Vector con la población enferma:
    problacion_enferma_2(i) = problacion_enferma_2(i-1) + incidencia_2(i-1);
    
    % Vector con el valor de la prevalencia:
    prevalencia_2(i) = problacion_enferma_2(i) ./ ( problacion_enferma_2(i) + problacion_susceptible_2(i) );
end

% Represento gráficamente la población enfermas y la población susceptibles
subplot(2,3,4)
hold on
plot(instante_tiempo_2, problacion_enferma_2, "r")
plot(instante_tiempo_2, problacion_susceptible_2, "b")
title('Población Enferma y Susceptible')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
hold off
legend('Población Enferma', 'Población Susceptible')

% Represento gráficamente la curación e incidencia
subplot(2,3,5)
hold on
plot(instante_tiempo_2, curados_2, 'g')
plot(instante_tiempo_2, incidencia_2, "b")
hold off
title('Curación e Incidencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
legend('Curados','Incidencia')

% Represento gráficamente la prevalencia
subplot(2,3,6)
plot(instante_tiempo_2, prevalencia_2, "b")
title('Prevalencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')