% Tópico II
% Integrantes:
%     - García Vargas Michell Alejandro
%     - León Paulin Daniel
% Grupo: 30           8vo. Semestre

clc; % Limpia la consola
clear all; % Limpia la memoria
close all; % Cierra todas las ventanas abiertas

load('./bd/memoria_letras.mat');

valores = memoria(:, 1:2);
etiqueta = memoria(:, 3);

if (dataset)
    letra_f = Caracteristicas(im2bw(imread('./entradas/letras/G/tipo19_24.png')));
else
    letra_f = Caracteristicas(im2bw(imread('./entradas/letras/6/24.png')));
end

for i=1:size(valores, 1)
    diferencia(i) = sum(abs(valores(i, :) - letra_f));
end

encontrado = find(diferencia == min(diferencia));
clase = etiqueta(encontrado);

clc;
display(['Letra: ' letras(clase)]);
display(['Minimo en Caracteristicas: ' num2str(min(diferencia))]);

