if isvalid(fig.screen)
    
    ix_cut = round(linspace(1,size(t_cut,2),2000*range(t_cut)));
    
    fig.plot = plot(t_cut(ix_cut),mean(x_cut(:,ix_cut),1),'parent',fig.graph);
    
    axis(fig.graph,'tight')
    set(fig.graph,'ylim',[-1 1],'ytick',-1:0.5:1)
    if max(t) <= 2
        set(fig.graph,'xticklabel',cellfun(@num2str,num2cell(round(1000* ...
            get(fig.graph,'xtick'))),'uniformoutput',false))
    end
    
    drawnow
    
end



