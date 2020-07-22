
hist_cols = {'Notificados'; 'Suspeitos'; 'Descartados'; 'Confirmados'; ...
             'Ativos'; 'Curados'; 'Óbitos por COVID-19'; 'Óbito por outras causas'};

hist_city = sort(unique(data_names(:,1)));
hist_neig = sort(unique(data_names(:,2)));

fig = figure();

fig_city = uicontrol('style','popup','string',['TODOS';hist_city],'parent',fig,...
    'units','normalized','position',[0.07 0.85 0.24 0.1],'callback','updateFig');

fig_neig = uicontrol('style','popup','string',['TODOS';hist_neig],'parent',fig,...
    'units','normalized','position',[0.38 0.85 0.24 0.1],'callback','updateFig');

fig_type = uicontrol('style','popup','string',hist_cols,'parent',fig,...
    'units','normalized','position',[0.69 0.85 0.24 0.1],'callback','updateFig');

fig_graph = subplot('position',[0.1 0.1 0.8 0.7],'parent',fig);