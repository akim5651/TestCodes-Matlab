%% Andrew Kim 10/2018
% Concatenates 2 video files @ variable length
clear;clc;close
%% video1
obj1=VideoReader('msCam2.avi');

%% video2
obj2=VideoReader('msCam3.avi');

%% label folder 'combined' in the same folder with the 2 video files ...
% 'msCam_Combined.avi' will be written

vidLength=round(obj1.Duration*obj1.FrameRate); 
outputVideo = VideoWriter(fullfile(cd,'combined/msCam_Combined.avi'));
outputVideo.FrameRate = obj1.FrameRate;
open(outputVideo);

% frame# , 2000 denotes end of second video (each video 1000 frames long)
t1 = 1;
t2 = 2000;

%% store vid1 into mov struct
mov = struct('cdata',zeros(obj1.Height,obj1.Width,'uint8'))
    info=get(obj1);

index = 0;
for i = 1:vidLength
    mov(i).cdata = readFrame(obj1, 'default');
end
%% store vid2 into mov struct
index2 = vidLength;
for j = 1:vidLength
    index2 = index2+1;
    mov(index2).cdata = readFrame(obj2, 'default');
end

%% write video from t1 to t2
totLength = (t2-t1)+1;
for k = t1:t2
    writeVideo(outputVideo, mov(k).cdata);
end
%% close video
close(outputVideo) % << close after having iterated through the videos