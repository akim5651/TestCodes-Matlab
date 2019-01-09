reader=VideoReader('behavCam9-10.avi');
% obj2.FrameRate = 90;
FNums=round(reader.Duration*reader.FrameRate);
writer = VideoWriter('behavCam9-10setFNum.avi');

% read.FrameRate = 60;
% write.FrameRate = 60;
open(writer);
% fnum = 1000;
% for n=1:3:FNums
%     read.CurrentTime = (fnum/read.FrameRate)/fnum*n;
%     frame = readFrame(read.CurrentTime);
%     writeVideo(write, frame);
% end
frames = struct('cdata', zeros(reader.Height, reader.Width, 'uint8'),...
    'colormap',[])
n=1;
m=1;
while reader.hasFrame
   frames(n).cdata = readFrame(reader);
   n = n+1;

end

for m = 1:2:n-1
    writeVideo(writer, frames(m).cdata);
%     m = m+2;
end

close(writer);