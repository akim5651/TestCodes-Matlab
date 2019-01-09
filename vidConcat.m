%% Synced Ca Plot Video
close all; tic;
obj=VideoReader('msCam1.avi');
obj2=VideoReader('msCam2.avi');
% obj3=VideoReader('behavCam9-10setFNum.avi');
% obj2.FrameRate = 90;
vidLength=round(obj.Duration*obj.FrameRate); % check for right struct field but its in there
write = VideoWriter('totaltest.avi');
open(write);
%% 

function vidChop

%boundaries centered around LP
LP = 73;
bound1 = 123;
bound2 = 222;
% marker = char(8659);
% lev1 = 50;
% lev2 = 100;
end

%% 
for k=1:vidLength
    img=imresize(readFrame(obj), [500, 700]);
    img2=imresize(readFrame(obj2), [500, 700]);
    img12=cat(2,img,img2);
    img3=readFrame(obj3);
    

%     fig=figure('Visible','off');
    fig=figure('Visible','off','units','normalized','outerposition',[0 0 1 1]);
    
    subplot_tight(2,4,1:3)
    imshow(img12,[])
    
    subplot_tight(2, 4, 4)
    imshow(img3,[])

    subplot(2,4,5:8)
%         plot(neuron.C_raw(:,:)'+[1:12], 'LineWidth',2, 'Color', [8/255 91/255 59/255])
    plot(neuron.C_raw(:,:)'+[1:12], 'LineWidth',2)
    axis([0 1000 0 13])
    ax1 = gca;
    xticks(xt)
    xticklabels({'0' '3.3' '6.7' '10.0' '13.3' '16.7' '20.0' '23.3' '26.7' '30.0' '33.3'})
%     set(ax1, 'XTick', 'FontSize',14,'FontWeight','bold')
    set(ax1, 'YTick', ytick, 'FontSize',16,'FontWeight','bold')
%     set(ax1, 'XTick', xt, 'XTickLabel', {'0' '3.3' '6.7' '10.0' '13.3' '16.7' '20.0' '23.3' '26.7' '30.0' '33.3'})


%     ax1_pos = ax1.Position;
%     ax2 = axes('Position',ax1_pos,...
%         'XAxisLocation','top',...
%         'YAxisLocation', 'right',...
%         'Color','none');
%     set(ax2, 'XTick', '','YTick','')
    %     xticklabels({'0' '3.3' '6.7' '10.0' '13.3' '16.7' '20.0' '23.3' '26.7' '30.0' '33.3'})
%     axis equal tight off;

    hold on;
    line([k k],[0 size(neuron.C,1)+1], 'LineWidth',3);
    hold off;
    
    %lever presses @ Fnum = 524 & 753
    if k >= lev1 
        line([lev1 lev1],[0 size(neuron.C,1)+1], 'LineWidth',2,'LineStyle','--')
%         axes(ax2)
%         set(ax2, 'XTick', '', 'XTickLabel', marker)
    end
    if k >= lev2
        line([lev2 lev2],[0 size(neuron.C,1)+1], 'LineWidth',2,'LineStyle','--')
    end
% marker = char(8659);
    
    now=getframe(fig);
    writeVideo(write, now);
end
close(write); toc;
%% Play or save synced movie

% implay(movie)
%movie2avi(mov, 'myEMG.avi', 'compression', 'None');
