try dcm_info = getCursorInfo(dcm_obj); catch, dcm_info = []; end

if ~isempty(dcm_info)
    
    if numel([dcm_info(:).DataIndex]) == 2
        
        pos = sort([find(t>=dcm_info(1).Position(1),1) find(t>=dcm_info(2).Position(1),1)]);
        
        x_sec = x_cut(:,pos(1):pos(2));
        t_sec = t_cut(pos(1):pos(2));
        
        ix_sec = round(linspace(1,size(t_sec,2),2000*range(t_sec)+1));
        
        try delete(fig.graph_sec), catch, end
        hold(fig.graph,'on')
        fig.graph_sec = plot(t_sec(ix_sec),mean(x_sec(:,ix_sec),1),'r','parent',fig.graph);
        hold(fig.graph,'off')
        
        dcm_obj.removeAllDataCursors
        dcm_new = dcm_obj.createDatatip(fig.plot);
        dcm_new.Cursor.DataIndex = round(2000*pos(1)/fs);
        dcm_new = dcm_obj.createDatatip(fig.plot);
        dcm_new.Cursor.DataIndex = round(2000*pos(2)/fs);
        dcm_info = dcm_obj.getCursorInfo;
        
    else
        
        x_sec = x;
        t_sec = t;
        try delete(fig.graph_sec), catch, end
        
    end
    
else
    
    x_sec = x;
    t_sec = t;
    try delete(fig.graph_sec), catch, end
    
end

drawnow

findFrequency
updateFrequency