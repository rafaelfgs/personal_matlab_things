
t = uint32(datenum('01-Fev-2020'):now());
hist_class = uint32(zeros(numel(t),8));

idx_city = true(size(data_names,1),1);
if fig_city.Value > 1
    idx_city = strcmp(data_names(:,1),hist_city(fig_city.Value-1));
end

idx_neig = true(size(data_names,1),1);
if fig_neig.Value > 1
    idx_neig = strcmp(data_names(:,2),hist_neig(fig_neig.Value-1));
end
idx_class = idx_city & idx_neig;

for k = 1:numel(t)
    idx_time = data_class<=t(k) & data_class>0;
    hist_class(k,1) = sum(idx_time(idx_class,1));
    hist_class(k,2) = sum(idx_time(idx_class,1) & ~any(idx_time(idx_class,2:3),2));
    hist_class(k,3) = sum(idx_time(idx_class,2));
    hist_class(k,4) = sum(idx_time(idx_class,3));
    hist_class(k,5) = sum(idx_time(idx_class,3) & ~any(idx_time(idx_class,4:6),2));
    hist_class(k,6) = sum(idx_time(idx_class,4));
    hist_class(k,7) = sum(idx_time(idx_class,5));
    hist_class(k,8) = sum(idx_time(idx_class,6));
end

fig_t = {'01/02';'01/03';'01/04';'01/05';'01/06';'01/07';'01/08';'01/09';'01/10';'01/11';'01/12'};
plot(t,hist_class(:,fig_type.Value),'k-','linewidth',2)
fig_graph.XTick = datenum(fig_t,'dd/mm');
fig_graph.XTickLabel = fig_t;
fig_graph.XGrid = 'on';