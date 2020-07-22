respdlg = true;

while respdlg
    
    cut_cell = inputdlg({'Lowest Frequency Allowed:','Highest Frequency Allowed:'},'Cut-off Frequencies', ...
                        [1 43; 1 43],sprintfc('%d',round(cut_freq*fs/size(x,2))));
    
    if numel(cut_cell) > 0
        if ~any(isnan(str2double(cut_cell)))
            respdlg = false;
        end
    else
        respdlg = false;
    end
    
end

if numel(cut_cell) > 0
    
    cut_cell{1}(strfind(cut_cell{1,:},',')) = '.';
    cut_cell{2}(strfind(cut_cell{2,:},',')) = '.';
    
    cut_freq = round(str2double(cut_cell)*size(x,2)/fs);
    cut_freq = min([max([cut_freq [0;0]],[],2) [size(x,2)/2;size(x,2)/2]],[],2);
    
    transf = zeros(size(x));
    x_cut = zeros(size(x));
    t_cut = t;
    
    for k = 1:size(x,1)
        transf(k,:) = fft(x(k,:));
        transf(k,[1:cut_freq(1) cut_freq(2):2*round(size(x,2)/2)-cut_freq(2)+1 end-cut_freq(1)+1:end] ) = 0;
        x_cut(k,:) = real(ifft(transf(k,:)));
    end
    
    x_sec = x_cut(:,pos(1):pos(2));
    t_sec = t_cut(pos(1):pos(2));
    
    updateGraph
    updateFrequency
    
end