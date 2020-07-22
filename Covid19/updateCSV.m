
file_name = 'dadosES.csv';
file_url = 'https://bi.static.es.gov.br/covid19/MICRODADOS.csv';

tic
fprintf('Baixando o Arquivo... ')
file_full = websave(file_name, file_url);
fprintf('%.1fs\n', toc)