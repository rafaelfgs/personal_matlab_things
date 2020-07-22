player = audioplayer(x_sec,fs);

if ~is_play
    
    set(fig.mainbut(:),'enable','off')
    set(fig.secbut(2:4),'enable','off')
    set(fig.secbut(1),'string','Stop')
    
    is_play = true;
    
    play(player)
    pause(0.2)
    
    play_timer = tic;
    
    for play_counter = [t_sec(1):0.1:t_sec(end) t_sec(end)]
        
        if is_play
            try delete(fig.graph_line), catch, end
            hold(fig.graph,'on')
            fig.graph_line = plot([play_counter play_counter],[-1 1],'k','parent',fig.graph);
            hold(fig.graph,'off')
            drawnow
        else
            try delete(fig.graph_line), catch, end %#ok<UNRCH>
            break
        end
        
        while t_sec(1)+toc(play_timer) < play_counter
        end
        
    end
    
    set(fig.mainbut(:),'enable','on')
    set(fig.secbut(:),'enable','on')
    set(fig.secbut(1),'string','Play')
    
    is_play = false;
    
else
    
    set(fig.mainbut(:),'enable','on')
    set(fig.secbut(:),'enable','on')
    set(fig.secbut(1),'string','Play')
    
    is_play = false;
    
    stop(player)
    
end