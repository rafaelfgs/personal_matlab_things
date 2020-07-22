set(fig.mainbut(:),'enable','off')
set(fig.secbut(:),'enable','off')

respdlg = true;

while respdlg
    
    t_cell = inputdlg('Enter Recording Time','Time',1,{'1'});
    
    if numel(t_cell) > 0
        if isempty(strfind(t_cell{1},',')) && ~isnan(str2double(t_cell{1}))
            if str2double(t_cell{1}) >= 0.5
                respdlg = false;
            end
        end
    else
        respdlg = false;
    end
    
end

if numel(t_cell) > 0
    
    t_max = str2double(t_cell{1});
    
    fs = 44100;
    f = 0:1:fs/2;
    t = 0:1/fs:t_max-1/fs;
    
    audio = audiorecorder(fs,8,1);
    recordblocking(audio,t_max+0.4);
    
    x = getaudiodata(audio)';
    x = x(end-size(t,2)+1:end);
    
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
    
    set(fig.secbut(:),'enable','on')
    
end

set(fig.mainbut(:),'enable','on')