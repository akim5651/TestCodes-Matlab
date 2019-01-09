clear; clc;
[file,path]= uigetfile;
fname = fullfile(path,file);

camNum = 0;
in = [
% Copy/Paste TTL/Timestamps:

11.9
31.5
52.4
83.3
110.3
180.3
338.8
545.8
671.2
845.6
1015.3
1174.5
1321.8
1678.8
2113.2
3045.8

];

summary = getSummary(in,camNum,fname)



