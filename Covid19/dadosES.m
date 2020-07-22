clear
close all

user_csv = strcmp(questdlg(['Deseja Atualizar a Base de Dados CSV?' 10], 'Base de Dados CSV', 'Sim', 'N�o', 'N�o'), 'Sim');
user_mat = strcmp(questdlg(['Deseja Atualizar a Base de Vari�vies MAT?' 10], 'Base de Vari�vies MAT', 'Sim', 'N�o', 'N�o'), 'Sim');

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