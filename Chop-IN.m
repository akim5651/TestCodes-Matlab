clear;clc;close
%%
obj1=VideoReader('msCam38.avi');
t1 = 759.8772067;
% t2 = 957.8371911;
f1 = round(t1); f2 = f1+99; 
%%
vidLength=round(obj1.Duration*obj1.FrameRate); % check for right struct field but its in there
outputVideo = VideoWriter(fullfile(cd,'output/msCam_BP.avi'));
outputVideo.FrameRate = obj1.FrameRate;

open(outputVideo);
% LP = 73;
% t1 = 3.676315789;
% t2 = 11.12830725;


%%

% if all clips are from the same source/have the same specifications
% just initialize with the settings of the first video in videoList

%%
 % >> open stream
% iterate over all videos you want to merge (e.g. in videoList)
mov = struct('cdata',zeros(obj1.Height,obj1.Width,'uint8'))
%     'colormap',zeros(256, 3, 'double'));
    info=get(obj1);
% obj1.CurrentTime = t1;

% store movie into mov struct
index = 0;
for i = 1:vidLength
    info=get(obj1);
    mov(i).cdata = readFrame(obj1, 'default');
    %     outputFrame = readFrame(obj);
%     writeVideo(outputVideo, mov(index).cdata);
end

%% write chopped portion

for j = f1:f2
    %     outputFrame = readFrame(obj);
    writeVideo(outputVideo, mov(j).cdata);
end


%%

close(outputVideo) % << close after having iterated through all videos