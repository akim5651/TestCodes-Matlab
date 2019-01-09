close all;
[r c] = size(neuron.C);
t1 = 596;
R = 896;
t2 = 1196;
int = t2-t1;

%%

for zR = 1:r
    for z_col = 1:int
        zC = z_col+t1;
        samp(zR,z_col) = neuron.C(zR,zC);
    end
end

% Zsamp = zscore(samp, [], 2);
%%
aucSamp = [];
for zR = 1:r
aucSamp(zR,1) = trapz(samp(zR,:));
end

