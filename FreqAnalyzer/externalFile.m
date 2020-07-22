set(fig.mainbut(:),'enable','off')
set(fig.secbut(:),'enable','off')

[file_name,path_name,~] = uigetfile({'*.mp3;*.m4a;*.mp4;*.wav;*.ogg;*.au;*.flac',...
                        'Audio Files (*.mp3,*.m4a,*.mp4,*.wav,*.ogg,*.au,*.flac)'});

try dcm_obj.removeAllDataCursors, catch, end
try delete(fig.graph_sec), catch, end

if file_name ~= 0
    
    [audio,fs] = audioread([path_name file_name]);
    
    f = 0:1:fs/2;
    t = 0:1/fs:(size(audio,1)-1)/fs;
    
    if size(audio,2) > 1
        msgbox({ ['"' file_name '"' ' has ' num2str(size(audio,2)) ' channels!'] ...
                 'Calculating average between the channels!'},'Warning')
    end
    
    x = audio';
    
    x_cut = x;
    t_cut = t;
    
    x_sec = x;
    t_sec = t;
    
    cut_freq = [0 size(x,2)/2];
    pos = [1 size(x,2)];
    
    freq = [];
    ampl = [];
    
    updateGraph
    updateFrequency
    
end

set(fig.mainbut(:),'enable','on')
set(fig.secbut(:),'enable','on')