close all;
[r c] = size(neuron.C);
t1 = 737;
R = 1037;
t2 = 1337;
int = t2-t1;
%% All Rewards - Plot
hold on;
plot(neuron.C_raw'+[1:r], 'LineWidth',.9)
ylim([0 r+3]);
box off;
set(gca,'Visible','off');


line([t1 t1],[0 r+1], 'LineWidth',1,'LineStyle','--')
line([R R],[0 r+1], 'Color','red', 'LineWidth',1,'LineStyle','--')
line([t2 t2],[0 r+1], 'LineWidth',1,'LineStyle','--')

%% samp C_raw
for zR = 1:r
    for z_col = 1:int
        zC = z_col+t1;
        sampRaw(zR,z_col) = double(neuron.C_raw(zR,zC));
    end
end
% Zsamp = zscore(sampRaw, 'all');

% subplot(2,1,1);
figure;
hold on;
ylim([-.5 1.3]);
avg_sampRaw = mean(sampRaw);
Zavg_sampRaw = zscore(avg_sampRaw);
plot(sampRaw');
% plot(avg_sampRaw,'r','LineWidth',2.2);

subt1 = 200;
subR = 300;
subt2 = 400;
% line([subt1 subt1],[-.5 1.3], 'LineWidth',2,'LineStyle',':')
line([subR subR],[-.5 1.3], 'Color','r', 'LineWidth',2,'LineStyle','-.')
% line([subt2 subt2],[-.5 1.3], 'LineWidth',2,'LineStyle',':')
% set(gca,'xtick',[])
% set(gca,'xticklabel',[])
% set(gca,'ytick',[])
% set(gca,'yticklabel',[])


% subplot(2,1,2);
figure;
hold on;
ylim([-.1 1.2]);
NormZavg_sampRaw = normalize(Zavg_sampRaw);
plot(NormZavg_sampRaw,'k','LineWidth',2.2);

% line([subt1 subt1],[0 1.2], 'LineWidth',2,'LineStyle',':')
line([subR subR],[-.1 1.2], 'Color','r', 'LineWidth',2,'LineStyle','-.')
% line([subt2 subt2],[0 1.2], 'LineWidth',2,'LineStyle',':')
% set(gca,'xtick',[])
% set(gca,'xticklabel',[])
% set(gca,'ytick',[])
% set(gca,'yticklabel',[])

aucSampRaw = trapz(NormZavg_sampRaw)
% ZRows = zscore(sampRaw,[],2);
% Zsingle = mean(ZRows);
% plot(ZRows');
% plot(Zsingle,'b','LineWidth',2.2)
%% samp C
for zR = 1:r
    for z_col = 1:int
        zC = z_col+t1;
        samp(zR,z_col) = neuron.C(zR,zC);
    end
end
% Zavg_samp = zscore(samp, [], 2);

subt1 = 200;
subR = 300;
subt2 = 400;

% subplot(2,1,1);
figure;
hold on;
ylim([-.1 1.5]);
avg_samp = mean(samp);
Zavg_samp = zscore(avg_samp);
plot(samp');
% plot(avg_samp,'k','LineWidth',2.2);

% line([subt1 subt1],[0 162], 'LineWidth',2,'LineStyle',':')
line([subR subR],[-.1 1.5], 'Color','r', 'LineWidth',2,'LineStyle','-.')
% % line([subt2 subt2],[0 1.2], 'LineWidth',2,'LineStyle',':')
% set(gca,'xtick',[])
% set(gca,'xticklabel',[])
% set(gca,'ytick',[])
% set(gca,'yticklabel',[])

figure;
% subplot(2,1,2);
ylim([-.1 1.1]);
NormZavg_samp = normalize(avg_samp);
plot(NormZavg_samp,'k','LineWidth',2.2);

% line([subt1 subt1],[0 1], 'LineWidth',2,'LineStyle',':')
line([subR subR],[0 1], 'Color','red', 'LineWidth',2,'LineStyle','-.')
% line([subt2 subt2],[0 1], 'LineWidth',2,'LineStyle',':')
set(gca,'xtick',[])
set(gca,'xticklabel',[])
yticks([0 0.5 1])

aucSamp = trapz(NormZavg_samp)
%% Plot markers for t1, R, t2

line([t1 t1],[0 r+1], 'LineWidth',1,'LineStyle','--')
line([R R],[0 r+1], 'Color','red', 'LineWidth',1,'LineStyle','--')
line([t2 t2],[0 r+1], 'LineWidth',1,'LineStyle','--')

%% Plot single neuron
hold on;
plot(neuron.C_raw(33,:), 'LineWidth',1.5)
plot(neuron.C(33,:),'r', 'LineWidth',1.8)
set(gca,'ytick',[])
set(gca,'xtick',[])
% ylim([0 r+3]);
% box off;
% set(gca,'Visible','off');

% for q = 1:size(behavTTL,2)
%     line([t1(q) t1(q)],[0 r], 'Color','green', 'LineWidth',0.5,'LineStyle','-')
%     line([R(q) R(q)],[0 r], 'Color','blue', 'LineWidth',1,'LineStyle','--')
%     line([t2(q) t2(q)],[0 r], 'Color','red','LineWidth',0.5,'LineStyle','-')
% end
