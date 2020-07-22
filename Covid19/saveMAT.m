
tic
fprintf('Salvando Arquivo MAT... ')
if exist('data.mat','file')
    movefile('data.mat','data_old.mat')
end
save('data.mat','data_class','data_cols','data_names')
fprintf('%.1fs\n', toc)