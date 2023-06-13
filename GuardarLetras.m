% Topico II
% Integrantes:
%     - Garcia Vargas Michell Alejandro
%     - Leon Paulin Daniel
% Grupo: 30           8vo. Semestre

clc; % Limpia la consola
clear all; % Limpia la memoria
close all; % Cierra todas las ventanas abiertas

%% Lectura de las letras de los dataset
% True = Primer Dataset
% False = Segundo Dataset
dataset = true;

memoria = [];
if (dataset)
    % Letras que existen en el primer dataset
    letras = ['A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'; 'N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z'];
    ruta = './entradas/letras/'; % Ruta del primer dataset

    % Leer cantidad de directorios dentro del directorio 'letras'
    ruta_palabras = cell(size(letras, 1), 1);
    tamano_directorio = zeros(size(letras, 1), 1);
    
    % Cuenta la cantidad de archivos (excluyendo directorios)
    for i = 1:size(letras, 1)
        ruta_palabras{i} = fullfile(ruta, letras(i, :), '/');
        archivos = dir(ruta_palabras{i});
        tamano_directorio(i) = sum(~[archivos.isdir]);
    end

    % Generar las caracteristicas de cada imagen dentro del directorio
    for i=1:size(tamano_directorio, 1)
        for j=1:tamano_directorio(i)
            letra_f = Caracteristicas(im2bw(imread(strcat(ruta_palabras{i}, 'tipo', num2str(i+12), '_', num2str(j), '.png'))));

            if (i == 1 && j == 1)
                memoria = [letra_f i];
            else
                memoria = [memoria; letra_f i];
            end
        end
    end
else
    % Letras que existen en el segundo dataset
    letras = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'; 'A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'; 'N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z'];
    ruta = './entradas/letras2/'; % Ruta del segundo dataset

    % Leer cantidad de directorios dentro del directorio 'letras2'
    ruta_letras = dir(fullfile(ruta));
    tamano_directorio = sum([ruta_letras.isdir]);

    % Leer cantidad de archivos dentro de cada directorio
    for i=1:tamano_directorio
        ruta_palabras{i} = fullfile(ruta, num2str(i));
        archivos = dir(ruta_palabras{i});
        tamano_palabras(i) = sum(~[archivos.isdir]);
    end
    
    % Generar las caracteristicas de cada imagen dentro del directorio
    for i=1:tamano_directorio
        for j=1:tamano_palabras(i)
            letra_f = Caracteristicas(im2bw(imread(strcat(ruta, num2str(i), '/', num2str(j), '.png'))));

            if (i == 1 && j == 1)
                memoria = [letra_f i];
            else
                memoria = [memoria; letra_f i];
            end
        end
    end
end

% Guardar y salvar la memoria del segundo dataset
save('./bd/memoria_letras.mat');

