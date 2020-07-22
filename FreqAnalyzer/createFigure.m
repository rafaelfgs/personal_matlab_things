fig.mainbut_name = {'Real-Time','Counted-Time','External File'};
fig.mainbut_call = {'realTime','countedTime','externalFile'};

fig.secbut_name  = {'Play','Frequency','Analyze','Data','Zoom','Pan'};
fig.secbut_call  = {'playAudio','cutoffFrequency','sectionAnalysis','dataSelection','zoomSelection','panSelection'};

fig.freqbut_name = {'-','-','-','-','-','-','-','-'};

fig.screen = figure('menubar','none','numbertitle','off','name','Frequency Test');

fig.graph_panel = uipanel(fig.screen,'units','normalized','position', ...
                  [0.01 0.22 0.98 0.52],'bordertype','none');

for k = 1:size(fig.mainbut_name,2)
    fig.mainbut_panel(k) = uipanel(fig.screen,'units','normalized','bordertype','none','position', ...
                           [k*(1-0.54*size(fig.mainbut_name,2)^0.2)/(size(fig.mainbut_name,2)+1)+(k-1)* ...
                           0.54/size(fig.mainbut_name,2)^0.8 0.88 0.54/size(fig.mainbut_name,2)^0.8 0.1]);
end

for k = 1:size(fig.secbut_name,2)
    fig.secbut_panel(k) = uipanel(fig.screen,'units','normalized','bordertype','none','position', ...
                          [k*(1-0.54*size(fig.secbut_name,2)^0.2)/(size(fig.secbut_name,2)+1)+(k-1)* ...
                          0.54/size(fig.secbut_name,2)^0.8 0.78 0.54/size(fig.secbut_name,2)^0.8 0.07]);
end

for k = 1:size(fig.freqbut_name,2)
    fig.note_panel(k) = uipanel(fig.screen,'units','normalized','bordertype','none','position', ...
                        [k*(1-0.54*size(fig.freqbut_name,2)^0.2)/(size(fig.freqbut_name,2)+1)+(k-1)* ...
                        0.54/size(fig.freqbut_name,2)^0.8 0.10 0.54/size(fig.freqbut_name,2)^0.8 0.08]);
    fig.ampl_panel(k) = uipanel(fig.screen,'units','normalized','bordertype','none','position', ...
                        [k*(1-0.54*size(fig.freqbut_name,2)^0.2)/(size(fig.freqbut_name,2)+1)+(k-1)* ...
                        0.54/size(fig.freqbut_name,2)^0.8 0.06 0.54/size(fig.freqbut_name,2)^0.8 0.04]);
    fig.freq_panel(k) = uipanel(fig.screen,'units','normalized','bordertype','none','position', ...
                        [k*(1-0.54*size(fig.freqbut_name,2)^0.2)/(size(fig.freqbut_name,2)+1)+(k-1)* ...
                        0.54/size(fig.freqbut_name,2)^0.8 0.02 0.54/size(fig.freqbut_name,2)^0.8 0.04]);
end

fig.graph = subplot(1,1,1,'parent',fig.graph_panel,'position',[0.06 0.09 0.9 0.89]);

for k = 1:size(fig.mainbut_name,2)
    fig.mainbut(k) = uicontrol('parent',fig.mainbut_panel(k),'style','pushbutton','fontsize',11, ...
                     'units','normalized','position',[0 0 1 1],'string',fig.mainbut_name{k});
    try set(fig.mainbut(k),'callback',fig.mainbut_call{k}), catch, end
end

for k = 1:size(fig.secbut_name,2)
    fig.secbut(k) = uicontrol('parent',fig.secbut_panel(k),'style','pushbutton','fontsize',7, ...
                    'units','normalized','position',[0 0 1 1],'enable','off','string',fig.secbut_name{k});
    try set(fig.secbut(k),'callback',fig.secbut_call{k}), catch, end
end

for k = 1:size(fig.freqbut_name,2)
    fig.note(k) = uicontrol('parent',fig.note_panel(k),'style','text','fontsize',18, ...
                  'units','normalized','position',[0 0 1 1],'string',fig.freqbut_name{k});
    fig.ampl(k) = uicontrol('parent',fig.ampl_panel(k),'style','text','fontsize',08, ...
                  'units','normalized','position',[0 0 1 1],'string',fig.freqbut_name{k});
    fig.freq(k) = uicontrol('parent',fig.freq_panel(k),'style','text','fontsize',08, ...
                  'units','normalized','position',[0 0 1 1],'string',fig.freqbut_name{k});
end