transf_sec = zeros(size(x_sec,1),fs);
for k = 1:size(x_sec,1)
    transf_sec(k,:) = fft(x_sec(k,:),fs);
end

transf_sec = sum(abs(transf_sec(:,1:fs/2+1)),1)/sum(sum(abs(transf_sec(:,1:fs/2+1)),2),1);

freq_min = 10^(log10(note_fund)-(log10(55)-log10(27.5))/24);
freq_range = 8;
freq_num = 0;

freq = f(f >= freq_min & transf_sec >= ampl_range(1) & ...
         transf_sec >= ampl_range(2)*max(transf_sec(f>=freq_min)));

ampl = transf_sec(f >= freq_min & transf_sec >= ampl_range(1) & ...
                  transf_sec >= ampl_range(2)*max(transf_sec(f>=freq_min)));

for k = 1:numel(freq)
    
    if freq(k) > freq_min && freq(k) < size(f,2)-freq_range && ...
       all(ampl(k) >= transf_sec(find(f==freq(k))+(-freq_range:freq_range)))
        
        freq_num = freq_num + 1;
        
        ind = find( transf_sec( find(f==freq(k)) + (-freq_range:freq_range) ) >= ...
                    ampl_range(2)*ampl(k) ) + find(f==freq(k)) - (freq_range+1);
        
        freq(freq_num) = sum(f(ind).*transf_sec(ind).^2) / sum(transf_sec(ind).^2);
        
        ampl(freq_num) = sqrt(sum(transf_sec(ind).^2));
        
    end
    
end

ind = freq < freq_min | (1:numel(freq)) > freq_num;
freq(ind) = [];
ampl(ind) = [];

if numel(freq) > 0
    [ampl,ind] = sort(ampl,'descend');
    freq = freq(ind);
end