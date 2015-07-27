function greedy(flow_avg, bandwidth_avg, gk, loop_max)
%Author: Di Yao; Reviewer: Z P
%Date: 2010-08-27; Reviewed: 2015-07-27
%Algorithm greedy
%Input:f1,f2,...,fk; b1,b2,...,bk; k=;
%Output:s1,s2,...,sk

if nargin < 1
    flow_avg = 100;
end
if nargin < 2
    bandwidth_avg = 100;
end
if nargin < 3
    gk = 20;
end
if nargin < 4
    loop_max = 1000;
end

%init variable
% loop_max = 1000; % Maximum number of loop
% gk=20;
global gH;
global gtotallostpacketradio;
global gtotalmovepacketradio;

gtotallostpacketradio=zeros(1,loop_max);
gtotalmovepacketradio=zeros(1,loop_max);
gH=zeros(1,loop_max);

for gloop=1:loop_max
    
gOriginalf = poissrnd(flow_avg, 1, gk);
gOriginalb = poissrnd(bandwidth_avg, 1, gk);
% gOriginalf=[48    49    56    65    49]
% gOriginalb=[44    46    39    45    57]

gFinalf=gOriginalf;
gFinalb=gOriginalb;

gs = zeros(1,gk);
gtotallostpacket=0;
gtotalmovepacket=0;

%start
for i=1:gk
    gs(i)=gFinalb(i)-gFinalf(i);
end;

% disp('oldgs=');
% disp(gs);

i=1;
j=i+1;
while gs(i)<0&&j<=gk
    if gs(j)<=0
        j=j+1;
    else
        if abs(gs(i))<=gs(j)
            gtotalmovepacket=gtotalmovepacket-gs(i);
            gs(j)=gs(j)+gs(i);
            gs(i)=0;
            if j-i>gH(gloop);
                gH(gloop)=j-i;
            end;
        else
            gtotalmovepacket=gtotalmovepacket+gs(j);
            gs(i)=gs(j)+gs(i);
            gs(j)=0;
            if j-i>gH(gloop);
                gH(gloop)=j-i;
            end;
        end;
    end;  
end;
    
for i=2:gk-1
    j=i+1;
    k=i-1;
    if gs(j)>=gs(k)
        while gs(i)<0&&j<=gk
            if gs(j)<=0
                j=j+1;
            else
                if abs(gs(i))<=gs(j)
                    gtotalmovepacket=gtotalmovepacket-gs(i);
                    gs(j)=gs(j)+gs(i);
                    gs(i)=0;
                    if j-i>gH(gloop);
                        gH(gloop)=j-i;
                    end;
                else
                    gtotalmovepacket=gtotalmovepacket+gs(j);
                    gs(i)=gs(j)+gs(i);
                    gs(j)=0;
                    if j-i>gH(gloop);
                        gH(gloop)=j-i;
                    end;
                end;
            end;  
        end;
        
        while gs(i)<0&&k>=1
            if gs(k)<=0
                k=k-1;
            else
                if abs(gs(i))<=gs(k)
                    gtotalmovepacket=gtotalmovepacket-gs(i);
                    gs(k)=gs(k)+gs(i);
                    gs(i)=0;
                    if i-k>gH(gloop);
                        gH(gloop)=i-k;
                    end;
                else
                    gtotalmovepacket=gtotalmovepacket+gs(k);
                    gs(i)=gs(k)+gs(i);
                    gs(k)=0;
                    if i-k>gH(gloop);
                        gH(gloop)=i-k;
                    end;
                end;
            end;  
        end;
        
    else
        while gs(i)<0&&k>=1
            if gs(k)<=0
                k=k-1;
            else
                if abs(gs(i))<=gs(k)
                    gtotalmovepacket=gtotalmovepacket-gs(i);
                    gs(k)=gs(k)+gs(i);
                    gs(i)=0;
                    if i-k>gH(gloop);
                        gH(gloop)=i-k;
                    end;
                else
                    gtotalmovepacket=gtotalmovepacket+gs(k);
                    gs(i)=gs(k)+gs(i);
                    gs(k)=0;
                    if i-k>gH(gloop);
                        gH(gloop)=i-k;
                    end;
                end;
            end;  
        end;
        
        while gs(i)<0&&j<=gk
            if gs(j)<=0
                j=j+1;
            else
                if abs(gs(i))<=gs(j)
                    gtotalmovepacket=gtotalmovepacket-gs(i);
                    gs(j)=gs(j)+gs(i);
                    gs(i)=0;
                    if j-i>gH(gloop);
                        gH(gloop)=j-i;
                    end;
                else
                    gtotalmovepacket=gtotalmovepacket+gs(j);
                    gs(i)=gs(j)+gs(i);
                    gs(j)=0;
                    if j-i>gH(gloop);
                        gH(gloop)=j-i;
                    end;
                end;
            end;  
        end;
        
    end;
end;

i=gk;
k=i-1;
while gs(i)<0&&k>=1
    if gs(k)<=0
        k=k-1;
    else
        if abs(gs(i))<=gs(k)
            gtotalmovepacket=gtotalmovepacket-gs(i);
            gs(k)=gs(k)+gs(i);
            gs(i)=0;
            if i-k>gH(gloop);
                gH(gloop)=i-k;
            end;
        else
            gtotalmovepacket=gtotalmovepacket+gs(k);
            gs(i)=gs(k)+gs(i);
            gs(k)=0;
            if i-k>gH(gloop);
                gH(gloop)=i-k;
            end;
        end;
    end; 
end;

for i=1:gk
    if gs(i)<0
        gtotallostpacket=gtotallostpacket-gs(i);
    end;
end;

gtotallostpacketradio(gloop)=gtotallostpacket/sum(gOriginalf);
gtotalmovepacketradio(gloop)=gtotalmovepacket/sum(gOriginalf);

% disp('gFinalf=');
% disp(gFinalf);
% disp('gs=');
% disp(gs);
% disp('gtotallostpacket=');
% disp(gtotallostpacket);
% disp('gtotallostpacketradio=');
% disp(gtotallostpacketradio(gloop));
% disp('gtotalmovepacket=');
% disp(gtotalmovepacket);
% disp('gtotalmovepacketradio=');
% disp(gtotalmovepacketradio(gloop));
% disp('gH=');
% disp(gH(gloop));

end;