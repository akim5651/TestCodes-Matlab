
[r c] = size(neuron.C);
t1 = 737;
R = 1037;
t2 = 1337;
int = t2-t1;
%% All Rewards - Plot
close all;
hold on;
plot(neuron.C_raw'+[1:r], 'LineWidth',.9)
ylim([0 r+1]);
% box off;
% set(gca,'Visible','off');

% ax1 = gca;
% xticks(xt)
xticklabels({'0' '10' '20' '30' '40' '50' '60' '70' '80' '90' '100'})
yticks([ 10 20 30])
%     set(ax1, 'XTick', 'FontSize',14,'FontWeight','bold')
% set(ax1, 'YTick', ytick, 'FontSize',16,'FontWeight','bold')

line([t1 t1],[0 r+1], 'LineWidth',2,'LineStyle',':')
line([R R],[0 r+1], 'Color','red', 'LineWidth',1.5,'LineStyle','-.')
line([t2 t2],[0 r+1], 'LineWidth',2,'LineStyle',':')
