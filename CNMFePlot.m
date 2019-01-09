% clear;clc;close all;
% load('msCam_data_processed.mat');
[r c] = size(neuron.C);
% t1 = [];
% t2 = [];
% dT = [];
% R = [];
% CorrFactor = (5588/5624);
% behavTTL = [12.4
%     28.8
%     53.5
%     99.9
%     149.2
%     245.5
%     400.1]';

%% Compute dT windows -> frame number
for v = 1:size(behavTTL,2)
    t1(v) = (behavTTL(v)/2-5)*CorrFactor*10;
    t2(v) = (behavTTL(v)/2+10)*CorrFactor*10;
    R(v) = behavTTL(v)/2*CorrFactor*10;
end
dT = t2-t1;
%% All Rewards - Plot
hold on;
plot(spkfn()'+[1:r])
for q = 1:size(behavTTL,2)
    line([t1(q) t1(q)],[0 r], 'Color','green', 'LineWidth',0.5,'LineStyle','-')
    line([R(q) R(q)],[0 r], 'Color','blue', 'LineWidth',1,'LineStyle','--')
    line([t2(q) t2(q)],[0 r], 'Color','red','LineWidth',0.5,'LineStyle','-')
end
%% Single Plot
hold on;
plot(spkfn(:,:)'+[1:67]);
line([t1 t1],[0 67+1], 'LineWidth',1,'LineStyle','--')
line([R R],[0 67], 'Color','red', 'LineWidth',1,'LineStyle','--')
line([t2 t2],[0 67], 'LineWidth',1,'LineStyle','--')


%%
i = t1;
R1=zeros(r, dT);
%%
a = 1;
while i < t2-1
    
    R1(:, a) = spkfn(:,i);
    a = a+1;
    i = i+1;
end
%%
hold on;
figure;
plot(R1(:,:)'+[1:67]);
%line([t1 t1],[0 67+1], 'LineWidth',1,'LineStyle','--')
line([R-t1 R-t1],[0 67], 'Color','red', 'LineWidth',1,'LineStyle','--')
%line([t2 t2],[0 67], 'LineWidth',1,'LineStyle','--')
%%
% Collapse R1 = vector sum
sumR = [];
n = 1;
for m = 1:size(R1,2)
    sumR(m) = sum(R1(:,m));
end



%%
figure;
plot(sumR);
line([R-t1 R-t1], [0 3],'Color','green', 'LineWidth',1,'LineStyle','--');

