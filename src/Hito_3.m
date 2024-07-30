% --------------
% |   HITO 3   |
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

% Valor de la Tasa de Incidencia
tasa_incidencia = 0.1;

% Valor de la incidencia inicial
incidencia(1) = tasa_incidencia .* problacion_susceptible(1);

%Valor de la prevalencia inicial
prevalencia(1) = problacion_enferma(1) ./ ( problacion_enferma(1) + problacion_susceptible(1) );

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector con la incidencia según la poblacion susceptible
    incidencia(i) = tasa_incidencia .* problacion_susceptible(i-1);

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





% Tasa de Incidencia menor que la unidad
% Retomo los datos
problacion_susceptible(1) = 1000;
problacion_enferma(1) = 0;
tasa_incidencia = 0.001;
incidencia_2(1) = tasa_incidencia .* problacion_susceptible(1);

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector con la incidencia según la poblacion susceptible
    incidencia_2(i) = tasa_incidencia .* problacion_susceptible(i-1);

    % Vector con la población susceptible:
    problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia_2(i);
end

% Retomo los datos
problacion_susceptible(1) = 1000;
problacion_enferma(1) = 0;
tasa_incidencia = 0.0005;
incidencia_3(1) = tasa_incidencia .* problacion_susceptible(1);

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector con la incidencia según la poblacion susceptible
    incidencia_3(i) = tasa_incidencia .* problacion_susceptible(i-1);

    % Vector con la población susceptible:
    problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia_3(i);
end

% Represento gráficamente la incidencia
subplot(2,3,4)
hold on
plot(instante_tiempo, incidencia, "b")
plot(instante_tiempo, incidencia_2, "g")
plot(instante_tiempo, incidencia_3, "m")
hold off
title('Incidencias')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
legend('Incidencia Inicial','Incidencia Menor a la Unidad','Incidencia Menor a la Unidad')





% Población Enferma Inicial Mayor que 0
% Retomo los datos
problacion_susceptible(1) = 900;
problacion_enferma(1) = 100;
tasa_incidencia = 0.1;
incidencia_4(1) = tasa_incidencia .* problacion_susceptible(1);

% El bucle for se ejecutará tantas veces como instantes de tiempo haya
for i=2:length(instante_tiempo)

    % Vector con la incidencia según la poblacion susceptible
    incidencia_4(i) = tasa_incidencia .* problacion_susceptible(i-1);

    % Vector con la población susceptible:
    problacion_susceptible(i) = problacion_susceptible(i-1) - incidencia_4(i);
end

% Represento gráficamente la incidencia
subplot(2,3,5)
hold on
plot(instante_tiempo, incidencia, "b")
plot(instante_tiempo, incidencia_4, "k")
hold off
title('Incidencias')
ylabel('Número de personas')
xlabel('Instante de Tiempo')
legend('Incidencia Inicial','Incidencial con Poblacion Enferma Inicial')