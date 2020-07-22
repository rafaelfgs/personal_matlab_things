dcm_obj = datacursormode(fig.screen);

if ~isempty(dcm_obj.getCursorInfo) && strcmp(dcm_obj.enable,'on')
    if numel([dcm_obj.getCursorInfo.DataIndex]) >= 2
        dcm_obj.removeAllDataCursors
    end
end

set(dcm_obj,'enable','on','UpdateFcn',@dataCallback)