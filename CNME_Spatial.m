[F_r F_c] = size(neuron.Cn);
[r c] = size(neuron.C);

close all;
% instantiate concat matrix
concat = zeros(size(neuron.reshape(neuron.A(:, 1), 2)));
colormap lines;
for i = 1:r
    a = double(imbinarize(neuron.reshape(neuron.A(:,i), 2)));
%%
    for m = 1:F_r
        for n = 1:F_c
            if a(m,n) ~= 0
                a(m,n) =  i;
            end
            
        end
    
 
    end
    
    %% check concat matrix
    concat = concat + a;
    for p = 1:F_r
        for q = 1:F_c
            if concat(p,q) ~= 0 && concat(p,q) >= i
                concat(p,q) = i;
            end
            
        end
        
    end
    
end

imagesc(concat);
box off;
set(gca,'Visible','off');
colormapeditor;
% colorbar;