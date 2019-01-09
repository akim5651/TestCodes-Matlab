clear;clc;close
%% video1

obj1=VideoReader('msCam2.avi');
obj2=VideoReader('msCam3.avi');
obj3=VideoReader('msCam4.avi');


%%
vidLength=round(obj1.Duration*obj1.FrameRate); % check for right struct field but its in there
outputVideo = VideoWriter(fullfile(cd,'combined/msCam_BP.avi'));
outputVideo.FrameRate = obj1.FrameRate;
open(outputVideo);
% LP = 73;
t1 = 1;
t2 = 3000;

%%
 % >> open stream
% iterate over all videos you want to merge (e.g. in videoList)
mov = struct('cdata',zeros(obj1.Height,obj1.Width,'uint8'))
%     'colormap',zeros(256, 3, 'double'));
    info=get(obj1);

% vid1
% store movie into mov struct
index = 0;
for i = 1:vidLength
    mov(i).cdata = readFrame(obj1, 'default');
end
%%
% store vid2 into mov struct
index2 = vidLength;
for j = 1:vidLength
    index2 = index2+1;
    mov(index2).cdata = readFrame(obj2, 'default');
end
%%
% store vid2 into mov struct
index3 = index2;
for j = 1:vidLength
    index3 = index3+1;
    mov(index3).cdata = readFrame(obj3, 'default');
end

%% write video from t1 to t2
totLength = (t2-t1)+1;
for k = t1:t2
    writeVideo(outputVideo, mov(k).cdata);
end

close(outputVideo) % << close after having iterated through all videos