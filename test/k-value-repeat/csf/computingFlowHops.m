function fh = computingFlowHops(i, flow )
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here
h=1;
j=i+1;
global ss;
global Originalb;
global H;
global loop;
while ss(j)<0
    if flow>Originalb(j)
        h=h+1;
        flow=flow-Originalb(j);
    end;
    if abs(ss(j))>flow
        computingFlowHops(j,abs(ss(j))-flow);
    end;
    j=j+1;
end;
if h>H(loop)
    H(loop)=h;
end;
