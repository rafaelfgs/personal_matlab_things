
data_dates = uint32(zeros(numel(data_table.DataNotificacao),7));
data_idx = false(numel(data_table.DataNotificacao),7);

tic
fprintf('Corrigindo Datas de Notificação... ')
data_table.DataNotificacao(strcmp(data_table.DataNotificacao,'')) = {'0000-01-00'};
data_table.DataNotificacao(strncmp(data_table.DataNotificacao,'2020-01',7)) = {'0000-01-00'};
data_idx(:,1) = strncmp(data_table.DataNotificacao,'0002',4) | ...
                 strncmp(data_table.DataNotificacao,'0202',4) | ...
                 strncmp(data_table.DataNotificacao,'2002',4) | ...
                 strncmp(data_table.DataNotificacao,'2010',4) | ...
                 strncmp(data_table.DataNotificacao,'2019',4);
data_table.DataNotificacao(data_idx(:,1)) = strcat('2020',cellfun(@(x) x(5:end),data_table.DataNotificacao(data_idx(:,1)),'un',0));
data_dates(:,1) = datenum(data_table.DataNotificacao,'yyyy-mm-dd');
fprintf('%.1fs\n', toc)

tic
fprintf('Corrigindo Datas de Cadastro... ')
data_table.DataCadastro(strcmp(data_table.DataCadastro,'')) = {'0000-01-00'};
data_table.DataCadastro(strncmp(data_table.DataCadastro,'2020-01',7)) = {'0000-01-00'};
data_idx(:,2) = strncmp(data_table.DataCadastro,'0002',4) | ...
                 strncmp(data_table.DataCadastro,'0202',4) | ...
                 strncmp(data_table.DataCadastro,'2002',4) | ...
                 strncmp(data_table.DataCadastro,'2010',4) | ...
                 strncmp(data_table.DataCadastro,'2019',4);
data_table.DataCadastro(data_idx(:,2)) = strcat('2020',cellfun(@(x) x(5:end),data_table.DataCadastro(data_idx(:,2)),'un',0));
data_dates(:,2) = datenum(data_table.DataCadastro,'yyyy-mm-dd');
fprintf('%.1fs\n', toc)

tic
fprintf('Corrigindo Datas de Diagnóstico... ')
data_table.DataDiagnostico(strcmp(data_table.DataDiagnostico,'')) = {'0000-01-00'};
data_table.DataDiagnostico(strncmp(data_table.DataDiagnostico,'2020-01',7)) = {'0000-01-00'};
data_idx(:,3) = strncmp(data_table.DataDiagnostico,'0002',4) | ...
                 strncmp(data_table.DataDiagnostico,'0202',4) | ...
                 strncmp(data_table.DataDiagnostico,'2002',4) | ...
                 strncmp(data_table.DataDiagnostico,'2010',4) | ...
                 strncmp(data_table.DataDiagnostico,'2019',4);
data_table.DataDiagnostico(data_idx(:,3)) = strcat('2020',cellfun(@(x) x(5:end),data_table.DataDiagnostico(data_idx(:,3)),'un',0));
data_dates(:,3) = datenum(data_table.DataDiagnostico,'yyyy-mm-dd');
fprintf('%.1fs\n', toc)

tic
fprintf('Corrigindo Datas de Coleta (RT-PCR)... ')
data_table.DataColeta_RT_PCR(strcmp(data_table.DataColeta_RT_PCR,'')) = {'0000-01-00'};
data_table.DataColeta_RT_PCR(strncmp(data_table.DataColeta_RT_PCR,'2020-01',7)) = {'0000-01-00'};
data_idx(:,4) = strncmp(data_table.DataColeta_RT_PCR,'0002',4) | ...
                 strncmp(data_table.DataColeta_RT_PCR,'0202',4) | ...
                 strncmp(data_table.DataColeta_RT_PCR,'2002',4) | ...
                 strncmp(data_table.DataColeta_RT_PCR,'2010',4) | ...
                 strncmp(data_table.DataColeta_RT_PCR,'2019',4);
data_table.DataColeta_RT_PCR(data_idx(:,4)) = strcat('2020',cellfun(@(x) x(5:end),data_table.DataColeta_RT_PCR(data_idx(:,4)),'un',0));
data_dates(:,4) = datenum(data_table.DataColeta_RT_PCR,'yyyy-mm-dd');
fprintf('%.1fs\n', toc)

tic
fprintf('Corrigindo Datas de Coleta (Teste Rápido)... ')
data_table.DataColetaTesteRapido(strcmp(data_table.DataColetaTesteRapido,'')) = {'0000-01-00'};
data_table.DataColetaTesteRapido(strncmp(data_table.DataColetaTesteRapido,'2020-01',7)) = {'0000-01-00'};
data_idx(:,5) = strncmp(data_table.DataColetaTesteRapido,'0002',4) | ...
                 strncmp(data_table.DataColetaTesteRapido,'0202',4) | ...
                 strncmp(data_table.DataColetaTesteRapido,'2002',4) | ...
                 strncmp(data_table.DataColetaTesteRapido,'2010',4) | ...
                 strncmp(data_table.DataColetaTesteRapido,'2019',4);
data_table.DataColetaTesteRapido(data_idx(:,5)) = strcat('2020',cellfun(@(x) x(5:end),data_table.DataColetaTesteRapido(data_idx(:,5)),'un',0));
data_dates(:,5) = datenum(data_table.DataColetaTesteRapido,'yyyy-mm-dd');
fprintf('%.1fs\n', toc)

tic
fprintf('Corrigindo Datas de Encerramento... ')
data_table.DataEncerramento(strcmp(data_table.DataEncerramento,'')) = {'0000-01-00'};
data_table.DataEncerramento(strncmp(data_table.DataEncerramento,'2020-01',7)) = {'0000-01-00'};
data_idx(:,6) = strncmp(data_table.DataEncerramento,'0002',4) | ...
                 strncmp(data_table.DataEncerramento,'0202',4) | ...
                 strncmp(data_table.DataEncerramento,'2002',4) | ...
                 strncmp(data_table.DataEncerramento,'2010',4) | ...
                 strncmp(data_table.DataEncerramento,'2019',4);
data_table.DataEncerramento(data_idx(:,6)) = strcat('2020',cellfun(@(x) x(5:end),data_table.DataEncerramento(data_idx(:,6)),'un',0));
data_dates(:,6) = datenum(data_table.DataEncerramento,'yyyy-mm-dd');
fprintf('%.1fs\n', toc)

tic
fprintf('Corrigindo Datas de Óbito... ')
data_table.DataObito(strcmp(data_table.DataObito,'')) = {'0000-01-00'};
data_table.DataObito(strncmp(data_table.DataObito,'2020-01',7)) = {'0000-01-00'};
data_idx(:,7) = strncmp(data_table.DataObito,'0002',4) | ...
                 strncmp(data_table.DataObito,'0202',4) | ...
                 strncmp(data_table.DataObito,'2002',4) | ...
                 strncmp(data_table.DataObito,'2010',4) | ...
                 strncmp(data_table.DataObito,'2019',4);
data_table.DataObito(data_idx(:,7)) = strcat('2020',cellfun(@(x) x(5:end),data_table.DataObito(data_idx(:,7)),'un',0));
data_dates(:,7) = datenum(data_table.DataObito,'yyyy-mm-dd');
fprintf('%.1fs\n', toc)