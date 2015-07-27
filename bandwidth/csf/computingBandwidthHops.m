function bh = computingBandwidthHops(i, B)
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here
h=1;
j=i+1;
global ss;
global Originalf;
global H;
global loop;
while ss(j)>0
    if(B>Originalf(j))
        h=h+1;
        B=B-Originalf(j);
    end;
    if abs(ss(j))>B
        computingBandwidthHops(j, abs(ss(j))-B);
    end;
    j=j+1;
end;
if h>H(loop)
    H(loop)=h;
end;
