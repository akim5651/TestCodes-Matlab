clear;clc;close
%%

obj1=VideoReader('msCam44.avi');

%%
obj2=VideoReader('msCam2.avi');
%%
vidLength=round(obj1.Duration*obj1.FrameRate); % check for right struct field but its in there
outputVideo = VideoWriter(fullfile(cd,'output/msCam_BP.avi'));


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

% vid1
t1 = 800;
index = 0;
for i = t1:vidLength
    info=get(obj1);
    index = i;
    mov(index).cdata = readFrame(obj1, 'default');
    %     outputFrame = readFrame(obj);
    writeVideo(outputVideo, mov(index).cdata);
end

%%
% vid2
t2 = 300;
index2 = ((vidLength - t1)+1)
for j = 1:t2
    info=get(obj2);
    index2 = j+1;
    mov(index2).cdata = readFrame(obj2, 'default');
    %     outputFrame = readFrame(obj);
    writeVideo(outputVideo, mov(index2).cdata);
end


%%

close(outputVideo) % << close after having iterated through all videos