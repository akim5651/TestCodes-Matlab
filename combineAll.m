%% Andrew Kim 10/2018
% Concatenates all video files @ variable length
clear;clc;close
%% video1
allVids = {};
fname_allVids = {};
foldername = '';
filetype = 'avi'; % type of files to be processed
        % Types currently supported .tif/.tiff, .h5/.hdf5, .raw, .avi, and .mat files
files = subdir(fullfile(foldername,['*.',filetype]));
numFiles = length(files);

allVidObj = {};
for a = 1:numFiles
[filepath,name,ext] = fileparts(files(a).name);
fname_allVids{a} = strcat(name,ext);
%     allVideos(a) = VideoReader(strcat'
allVidObj{a}=VideoReader(fname_allVids{a});
end

%% initialize
tic
display('Initializing')
initVid=allVidObj{a};
mkdir('combined2x');
outputVideo = VideoWriter(fullfile(cd,'combined2x/msCam_Combined.avi'));
outputVideo.FrameRate = 2*initVid.FrameRate;
open(outputVideo);

mov = struct('cdata', zeros(initVid.Height,initVid.Width,'uint8'))
    info=get(initVid);

    toc
%% concatenates all video files in folder
clc;
tic
display('Concatenating video files...')
last_frame = 0;
prev_marker = 1;
for i = 1:numFiles
    
    currVid_frameNum = allVidObj{i}.FrameRate*allVidObj{i}.Duration;
    
    last_frame = currVid_frameNum + last_frame;
    
    for t = prev_marker:last_frame
        mov(t).cdata = readFrame(allVidObj{i}, 'default');
                writeVideo(outputVideo, mov(t).cdata);
    end
    
    prev_marker = currVid_frameNum + prev_marker;
    
end
toc
%% close video
close(outputVideo)