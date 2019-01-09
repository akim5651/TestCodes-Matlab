function summary = getSummary(in, CameraNUM, filename)
%%
DAT = readtable(filename);
%%
rewardTime = 1000*in;
%rewardTime_String = cellstr(num2str(rewardTime))
%%
msCam_rows = DAT.camNum==CameraNUM;
%%

msCamSet = DAT(msCam_rows,:);
%% 
err = 100;
%subsetrows = DAT.sysClock==rewardTime;
for i = 1:size(rewardTime,1)
    for j = 1:size(msCamSet,1)
        if abs(msCamSet.sysClock(j)-rewardTime(i))<err
            frameInt(i) = msCamSet.frameNum(j);
        end
    end
end
%%
frameRec = frameInt';
summary = table(rewardTime, frameRec);

end
