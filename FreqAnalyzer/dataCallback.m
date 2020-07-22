function output_txt = dataCallback(~,event_obj)

pos = get(event_obj,'Position');

output_txt = {[num2str(pos(1),4),'s']};

end