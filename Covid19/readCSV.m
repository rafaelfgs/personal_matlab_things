
file_name = 'dadosES.csv';

tic
fprintf('Lendo o Arquivo CSV... ')
data_table = readtable(file_name, 'Delimiter', ';', 'format', repmat('%s',1,35));
fprintf('%.1fs\n', toc)