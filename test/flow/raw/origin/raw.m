%Author: Di Yao; Reviewer: Z P
%Date: 2010-08-26; Reviewed: 2015-07-27
%Algorithm raw
%Input:f1,f2,...,fk; b1,b2,...,bk; k=;
%Output:s1,s2,...,sk

%init variable
loop_max = 1000; % Maximum number of loop
rk=20;
rtotallostpacketradio=zeros(1,loop_max);

for rloop=1:loop_max
    
rOriginalf = poissrnd(100, 1, rk);
rOriginalb = poissrnd(110, 1, rk);
% Originalf=[5 2 8 13 3 2 2 8]
% Originalb=[5 2 8 8 2 2 10 8]

rFinalf=rOriginalf;
rFinalb=rOriginalb;

rs = zeros(1,rk);
rtotallostpacket=0;

%start
for i=1:rk
    rs(i)=rFinalb(i)-rFinalf(i);
    if rs(i)<0
        rtotallostpacket=rtotallostpacket-rs(i);
    end;
end;

rtotallostpacketradio(rloop)=rtotallostpacket/sum(rOriginalf);

disp('rFinalf=');
disp(rFinalf);
disp('rs=');
disp(rs);
disp('rtotallostpacketradio=');
disp(rtotallostpacketradio(rloop));

end;