if strcmp(get(zoom,'enable'),'off')
    zoom(fig.graph,'xon')
else
    zoom(fig.graph,'out')
end