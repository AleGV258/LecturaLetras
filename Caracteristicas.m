% Topico II
% Integrantes:
%     - Garcia Vargas Michell Alejandro
%     - Leon Paulin Daniel
% Grupo: 30           8vo. Semestre

function [F]= Caracteristicas(img)
    img = double(img);
    promedio = mean(mean(img));
    desv_estandar = std(std(img));
    F = [promedio, desv_estandar]; % Promedio, Desviacion Estandar
end

