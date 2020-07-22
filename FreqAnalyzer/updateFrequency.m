if isvalid(fig.screen)
    
    for k = 1:size(fig.freq,2)
        
        if numel(freq) >= k
            set(fig.freq(k),'string',[num2str(round(100*freq(k))/100) ' Hz'])
            set(fig.ampl(k),'string',[num2str(round(10000*ampl(k))/100) ' %'])
            set(fig.note(k),'string',[note_name{floor(mod(log10(freq(k)/note_fund)/...
                                               ((log10(55)-log10(27.5))/12)+0.5,12)+1)} ...
                                      num2str(floor(log10(freq(k)/note_fund)/log10(2)+1/24))])
        else
            set(fig.freq(k),'string','-')
            set(fig.ampl(k),'string','-')
            set(fig.note(k),'string','-')
        end
        
    end
    
    drawnow
    
end