function righthand(flow_avg, bandwidth_avg, rhk, loop_max)
%Author: Di Yao; Reviewed: Z P
%Date: 2010-08-27; Reviewd: 2015-07-27
%Algorithm righthand
%Input:f1,f2,...,fk; b1,b2,...,bk; k=;
%Output:s1,s2,...,sk

if nargin < 1
    flow_avg = 100;
end
if nargin < 2
    bandwidth_avg = 100;
end
if nargin < 3
    rhk = 20;
end
if nargin < 4
    loop_max = 1000;
end

global rhH;
global rhtotallostpacketradio;
global rhtotalmovepacketradio;
%init variable
% loop_max = 1000; % Maximum number of loop
% rhk = 20;
rhtotallostpacketradio=zeros(1,loop_max);
rhtotalmovepacketradio=zeros(1,loop_max);
rhH=zeros(1,loop_max);

for rhloop=1:loop_max
    
rhOriginalf = poissrnd(flow_avg, 1, rhk);
rhOriginalb = poissrnd(bandwidth_avg, 1, rhk);
% rhOriginalf=[48    49    56    65    49]
% rhOriginalb=[44    46    39    45    57]

rhFinalf=rhOriginalf;
rhFinalb=rhOriginalb;

rhs = zeros(1,rhk);
rhtotallostpacket=0;
rhtotalmovepacket=0;

%start
for i=1:rhk
    rhs(i)=rhFinalb(i)-rhFinalf(i);
end;

disp('oldrhs=');
disp(rhs);

for i=1:rhk
    j=i+1;
    while rhs(i)<0&&j<=rhk
        if rhs(j)<=0
            j=j+1;
        else
            if abs(rhs(i))<=rhs(j)
                rhtotalmovepacket=rhtotalmovepacket-rhs(i);
                rhs(j)=rhs(j)+rhs(i);
                rhs(i)=0;
                if j-i>rhH(rhloop);
                    rhH(rhloop)=j-i;
                end;
            else
                rhtotalmovepacket=rhtotalmovepacket+rhs(j);
                rhs(i)=rhs(j)+rhs(i);
                rhs(j)=0;
                if j-i>rhH(rhloop);
                    rhH(rhloop)=j-i;
                end;
            end;
        end;  
    end;
end;

for i=1:rhk
    if rhs(i)<0
        rhtotallostpacket=rhtotallostpacket-rhs(i);
    end;
end;

rhtotallostpacketradio(rhloop)=rhtotallostpacket/sum(rhOriginalf);
rhtotalmovepacketradio(rhloop)=rhtotalmovepacket/sum(rhOriginalf);

% disp('rhFinalf=');
% disp(rhFinalf);
disp('rhs=');
disp(rhs);
% disp('rhtotallostpacket=');
% disp(rhtotallostpacket);
disp('rhtotallostpacketradio=');
disp(rhtotallostpacketradio(rhloop));
% disp('rhtotalmovepacket=');
% disp(rhtotalmovepacket);
disp('rhtotalmovepacketradio=');
disp(rhtotalmovepacketradio(rhloop));
disp('rhH=');
disp(rhH(rhloop));

end;