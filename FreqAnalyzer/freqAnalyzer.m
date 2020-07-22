close all
clear
clc

ampl_range = [1/1000 1/10];

createFigure

alocateVariables

updateGraph

% spectrogram(mean(x,1),round(32*size(x,2)/fs),round(16*size(x,2)/fs),fs/100,fs)