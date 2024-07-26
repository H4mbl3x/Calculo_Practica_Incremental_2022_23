clear
clc
% --------------
% |   HITO 4   |
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

%Valor de la prevalencia inicial
prevalencia(1) = problacion_enferma(1) ./ ( problacion_enferma(1) + problacion_susceptible(1) );

% Valor de la Tasa de Contagio
tasa_contagio = 0.5;

% Valor de la Tasa de Incidencia
tasa_incidencia(1) = tasa_contagio .* prevalencia(1);

% Valor de la incidencia inicial
incidencia(1) = tasa_incidencia(1) .* problacion_susceptible(1);

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Valor de la Tasa de Incidencia
    tasa_incidencia(i) = tasa_contagio .* prevalencia(i-1);

    % Vector con la incidencia según la poblacion susceptible
    incidencia(i) = tasa_incidencia(i) .* problacion_susceptible(i-1);

    % Vector con la población susceptible:
    problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia(i-1);

    % Vector con la población enferma:
    problacion_enferma(i) = problacion_enferma(i-1) + incidencia(i-1);

    % Vector con el valor de la prevalencia:
    prevalencia(i) = problacion_enferma(i) ./ ( problacion_enferma(i) + problacion_susceptible(i) );
end

% Represento gráficamente la incidencia
subplot(4,3,1)
plot(instante_tiempo, incidencia, "b")
title('Incidencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la prevalencia
subplot(4,3,2)
plot(instante_tiempo, prevalencia, "b")
title('Prevalencia')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la población enfermas y la población susceptibles
subplot(4,3,3)
hold on
plot(instante_tiempo, problacion_enferma, "r")
plot(instante_tiempo, problacion_susceptible, "b")
title('Población Enferma y Susceptible')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
hold off
legend('Población Enferma', 'Población Susceptible')

display ('Pregunta: ¿Tiene sentido la simulación?')
display ('Sí tiene sentido la simulación puesto que no hay ningún contagio inicial')





% Tasa de Contagio Menor que la Unidad

% Retomo los datos
problacion_susceptible_2(1) = 900;
problacion_enferma_2(1) = 100;
prevalencia_2(1) = problacion_enferma_2(1) ./ ( problacion_enferma_2(1) + problacion_susceptible_2(1) );
tasa_contagio_2 = 0.01;
tasa_incidencia_2(1) = tasa_contagio_2 .* prevalencia_2(1);
incidencia_2(1) = tasa_incidencia_2(1) .* problacion_susceptible_2(1);

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Valor de la Tasa de Incidencia
    tasa_incidencia_2(i) = tasa_contagio_2 .* prevalencia_2(i-1);

    % Vector con la incidencia según la poblacion susceptible
    incidencia_2(i) = tasa_incidencia_2(i) .* problacion_susceptible_2(i-1);

    % Vector con la población susceptible:
    problacion_susceptible_2(i) = problacion_susceptible_2(i-1) - incidencia_2(i-1);

    % Vector con la población enferma:
    problacion_enferma_2(i) = problacion_enferma_2(i-1) + incidencia_2(i-1);

    % Vector con el valor de la prevalencia:
    prevalencia_2(i) = problacion_enferma_2(i) ./ ( problacion_enferma_2(i) + problacion_susceptible_2(i) );
end

% Represento gráficamente la incidencia
subplot(4,3,4)
plot(instante_tiempo, incidencia_2, "b")
title('Incidencia con Tasa de Contagio')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la prevalencia
subplot(4,3,5)
plot(instante_tiempo, prevalencia_2, "b")
title('Prevalencia con Tasa de Contagio')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la población enfermas y la población susceptibles
subplot(4,3,6)
hold on
plot(instante_tiempo, problacion_enferma_2, "r")
plot(instante_tiempo, problacion_susceptible_2, "b")
title('Población Enferma y Susceptible con Tasa de Contagio')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
hold off
legend('Población Enferma', 'Población Susceptible')



% Retomo los datos
problacion_susceptible_3(1) = 800;
problacion_enferma_3(1) = 200;
prevalencia_3(1) = problacion_enferma_3(1) ./ ( problacion_enferma_3(1) + problacion_susceptible_3(1) );
tasa_contagio_3 = 0.005;
tasa_incidencia_3(1) = tasa_contagio_3 .* prevalencia_3(1);
incidencia_3(1) = tasa_incidencia_3(1) .* problacion_susceptible_3(1);

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Valor de la Tasa de Incidencia
    tasa_incidencia_3(i) = tasa_contagio_3 .* prevalencia_3(i-1);

    % Vector con la incidencia según la poblacion susceptible
    incidencia_3(i) = tasa_incidencia_3(i) .* problacion_susceptible_3(i-1);

    % Vector con la población susceptible:
    problacion_susceptible_3(i) = problacion_susceptible_3(i-1) - incidencia_3(i-1);

    % Vector con la población enferma:
    problacion_enferma_3(i) = problacion_enferma_3(i-1) + incidencia_3(i-1);

    % Vector con el valor de la prevalencia:
    prevalencia_3(i) = problacion_enferma_3(i) ./ ( problacion_enferma_3(i) + problacion_susceptible_3(i) );
end

% Represento gráficamente la incidencia
subplot(4,3,7)
plot(instante_tiempo, incidencia_3, "b")
title('Incidencia con Tasa de Contagio')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la prevalencia
subplot(4,3,8)
plot(instante_tiempo, prevalencia_3, "b")
title('Prevalencia con Tasa de Contagio')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la población enfermas y la población susceptibles
subplot(4,3,9)
hold on
plot(instante_tiempo, problacion_enferma_3, "r")
plot(instante_tiempo, problacion_susceptible_2, "b")
title('Población Enferma y Susceptible con Tasa de Contagio')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
hold off
legend('Población Enferma', 'Población Susceptible')





% Población Enfermas Inicialmente igual a 1
% Retomo los datos
problacion_susceptible_4(1) = 999;
problacion_enferma_4(1) = 1;
prevalencia_4(1) = problacion_enferma_4(1) ./ ( problacion_enferma_4(1) + problacion_susceptible_4(1) );
tasa_contagio_4 = 0.5;
tasa_incidencia_4(1) = tasa_contagio_4 .* prevalencia_4(1);
incidencia_4(1) = tasa_incidencia_4(1) .* problacion_susceptible_4(1);

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Valor de la Tasa de Incidencia
    tasa_incidencia_4(i) = tasa_contagio_4 .* prevalencia_4(i-1);

    % Vector con la incidencia según la poblacion susceptible
    incidencia_4(i) = tasa_incidencia_4(i) .* problacion_susceptible_4(i-1);

    % Vector con la población susceptible:
    problacion_susceptible_4(i) = problacion_susceptible_4(i-1) - incidencia_4(i-1);

    % Vector con la población enferma:
    problacion_enferma_4(i) = problacion_enferma_4(i-1) + incidencia_4(i-1);

    % Vector con el valor de la prevalencia:
    prevalencia_4(i) = problacion_enferma_4(i) ./ ( problacion_enferma_4(i) + problacion_susceptible_4(i) );
end

% Represento gráficamente la incidencia
subplot(4,3,10)
plot(instante_tiempo, incidencia_4, "b")
title('Incidencia con un Enfermo Inicial')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la prevalencia
subplot(4,3,11)
plot(instante_tiempo, prevalencia_4, "b")
title('Prevalencia con un Enfermo Inicial')
ylabel('Número de personas')
xlabel('Instante de Tiempo')

% Represento gráficamente la población enfermas y la población susceptibles
subplot(4,3,12)
hold on
plot(instante_tiempo, problacion_enferma_4, "r")
plot(instante_tiempo, problacion_susceptible_4, "b")
title('Población Enferma y Susceptible con un Enfermo Inicial')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
hold off
legend('Población Enferma', 'Población Susceptible')

display ('¿Qué día se alcanza la incidencia máxima?')
display ('La incidencia máxima se alcanza el día :')
incidencia_maxima = find(incidencia_4==max(incidencia_4));
display (incidencia_maxima(1))

display ('¿Qué día la prevalencia sobrepasa el 90% de la población?')
display ('La prevalencia sobrepasa el 90% de la población el día :')
dia_prevalencia_sobrepasada = find(prevalencia_4>0.9);
display(dia_prevalencia_sobrepasada(1))