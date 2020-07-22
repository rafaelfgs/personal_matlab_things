if ~is_rec
    
    set(fig.mainbut(2:end),'enable','off')
    set(fig.secbut(:),'enable','off')
    
    t_max = 0.6;
    
    fs = 44100;
    f = 0:1:fs/2;
    t = 0:1/fs:(t_max-0.4)-1/fs;
    
    audio = audiorecorder(fs,8,1);
    
    is_rec = true;
    
    while is_rec && isvalid(fig.screen)
        
        recordblocking(audio,t_max);
        x = getaudiodata(audio)';
        x = x(0.4*fs+1:end);
        
        x_cut = x;
        t_cut = t;
        
        x_sec = x;
        t_sec = t;
        
        cut_freq = [0 size(x,2)/2];
        pos = [1 size(x,2)];
        
        findFrequency
        updateGraph
        updateFrequency
        
    end
    
else
    
    set(fig.mainbut(2:3),'enable','on')
    
    is_rec = false;
    
end