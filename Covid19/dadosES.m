clear
close all

user_csv = strcmp(questdlg(['Deseja Atualizar a Base de Dados CSV?' 10], 'Base de Dados CSV', 'Sim', 'Não', 'Não'), 'Sim');
user_mat = strcmp(questdlg(['Deseja Atualizar a Base de Variávies MAT?' 10], 'Base de Variávies MAT', 'Sim', 'Não', 'Não'), 'Sim');

if user_csv
    updateCSV
end

if user_mat
    readCSV
    correctDates
    prepareData
    saveMAT
else
    readMAT
end

createFig
updateFig