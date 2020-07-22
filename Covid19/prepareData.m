
tic
fprintf('Preparando Variável MAT... ')

data_inf = inf(size(data_dates));
data_inf(data_dates>0) = data_dates(data_dates>0);

data_class = uint32(zeros(size(data_dates)));
data_cols = {'Suspeito', 'Descartados', 'Confirmados', 'Cura', 'Óbito pelo COVID-19', 'Óbito por outras causas'};

data_class(:,1) = min(data_inf(:,1:3),[],2);

data_class(:,2) = min(data_inf + repmat([15 15 15 3 1 0 0],size(data_dates,1),1),[],2);
data_class(~strcmp(data_table.Classificacao,data_cols{2}),2) = 0;

data_class(:,3) = min(data_inf(:,4:5) + repmat([3 1],size(data_dates,1),1),[],2);
data_class(~strcmp(data_table.Classificacao,data_cols{3}),3) = 0;

data_class(:,4) = min(data_inf(:,[1:3 6]) + repmat([20 20 20 0],size(data_dates,1),1),[],2);
data_class(~strcmp(data_table.Classificacao,data_cols{3}) | ~strcmp(data_table.Evolucao,data_cols{4}),4) = 0;

data_class(:,5) = min(data_inf(:,[6 7]),[],2);
data_class(~strcmp(data_table.Classificacao,data_cols{3}) | ~strcmp(data_table.Evolucao,data_cols{5}),5) = 0;

data_class(:,6) = min(data_inf(:,[6 7]),[],2);
data_class(~strcmp(data_table.Classificacao,data_cols{3}) | ~strcmp(data_table.Evolucao,data_cols{6}),6) = 0;

data_class(data_class>now()) = 0;

data_names = [data_table.Municipio data_table.Bairro];

fprintf('%.1fs\n', toc)