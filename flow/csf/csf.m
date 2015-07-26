function csf(flow_avg, bandwidth_avg, k, loop_max)
%Author: Di Yao; Reviewer: Z P
%Date: 2010-05-24; Reviewed: 2015-07-23
%Algorithm 1 L-CSF(k)
%Input:f1,f2,...,fk; b1,b2,...,bk; k=;
%Output:s1,s2,...,sk

if nargin < 1
    flow_avg = 50;
end
if nargin < 2
    bandwidth_avg = 50;
end
if nargin < 3
    k = 20;
end
if nargin < 4
    loop_max = 1000;
end

% loop_max = 1000; % Maximum number of loop
% flow_avg = 50; % Average of Flow
% bandwidth_avg = 50; % Average of Bandwidth
% k = 20;

global loop;     
%init variable
% l=25;
% L=500;
% n=L/l;
%The total data flow
% N=1000;
%The total available bandwidth
% M=1000;
%Epsilon = Min(M,N)
% Epsilon=min(M,N);
%k =O(sqrt(Epsilon*log(Epsilon))/Epsilon*n)
% global k; 
% k=20;
% k = 4;% test
global H;
global totallostpacketradio;
global totalmovepacketradio;
H=zeros(1, loop_max);
totallostpacketradio=zeros(1, loop_max);
totalmovepacketradio=zeros(1, loop_max);
global Originalf;
global Originalb;
global ss;

for loop=1:loop_max
    
Originalf = poissrnd(flow_avg, 1, k);
Originalb = poissrnd(bandwidth_avg, 1, k);
% Originalf = [3 0 2 4]; % test
% Originalb = [2 2 2 2]; % test

Finalf=Originalf;
Finalb=Originalb;

s = zeros(1,k);
% global ss;
ss = zeros(1,k);

% hop = zeros(1,k);
% hopleft = zeros(1,k);
% hopright = zeros(1,k);
%s=ones(1,5);

%start
s(1)=Finalb(1)-Finalf(1);
%Finalf(1)=Finalb(1);
%end
%disp('s(1)=');
%disp(s(1));
for i=2:k
    s(i)=Finalb(i)-Finalf(i)+s(i-1);
    %if s(i)<0
        %Finalf(i)=Finalb(i);
    %end
end
disp('s old =');
disp(s);

% i=k-1;
% while i>=1
ss(k) = 0;
for i=k-1:-1:1
    if (s(i+1) >= 0 && s(i) < 0)||(s(i+1) < 0 && s(i) >= 0)
        ss(i)=s(i);
    elseif s(i+1)>=0 && s(i)>=0
        if s(i+1)-s(i)>=ss(i+1)
            ss(i)=0;
        else
            ss(i)=s(i)-s(i+1)+ss(i+1);
        end
    elseif s(i+1)<0 && s(i)<0
        if s(i+1)-s(i)<=ss(i+1)
            ss(i)=0;
        else
            ss(i)=s(i)-s(i+1)+ss(i+1);
        end
    end
%     i=i-1;
end

Finalf(1)=Originalf(1)+ss(1);
j=2;
while j<=k
    Finalf(j)=Originalf(j)+ss(j)-ss(j-1);
    j=j+1;
end

for j=1:k
    Finalf(j)=min(Finalf(j),Finalb(j));
end

% for i=1:k
%     if ss(i)>=0
%         if (i==1)||(i==k&&s(i)<0)
%             hopleft(i)=0;
%         else 
%             temp1=0;
%             j=i;
%             while temp1<ss(i)
%                 temp1=temp1+Finalf(j-1)-Originalf(j-1)
%                 hopleft(i)=hopleft(i)+1
%                 j=j+1;
%             end
%         end
%     else
%         temp2=0;
%         j=i;
%         while temp2<-ss(i)
%             temp2=temp2+Finalf(j+1)-Originalf(j+1);
%             hopright(i)=hopright(i)+1;
%             j=j+1;
%         end
%     end
%     hop(i)=max(hopleft(i),hopright(i));
% end
% Maxhop=max(hop);

% disp('ss-old=');
% disp(ss);

if ss(1)<0
    computingFlowHops(1,abs(ss(1)));
end

for i=2:k
    if ss(i-1)>=0&&ss(i)<0
        computingFlowHops(i,abs(ss(i)));
    end
end

if ss(1)>0
    computingBandwidthHops(1,ss(1));
end

for i=2:k
    if ss(i-1)<=0&&ss(i)>0
        computingBandwidthHops(i,ss(i));
    end
end

disp('Originalb = ')
disp(Originalb)
disp('Originalf = ')
disp(Originalf)
disp('Finalf = ')
disp(Finalf)
disp('ss =')
disp(ss)
%disp('s =')
%disp(s)

totallostpacketradio(loop)=(sum(Originalf)-sum(Finalf))/sum(Originalf);
totalmovepacketradio(loop)=sum(abs(ss))/sum(Originalf);

% disp('Finalf=');
% disp(Finalf);
% disp('s=');
% disp(s);
% disp('ss=');
% disp(ss);
disp('totallostpacketradio=');
disp(totallostpacketradio(loop));
disp('totalmovepacketradio=');
disp(totalmovepacketradio(loop));
disp('H=');
disp(H(loop));
% disp('hop=');
% disp(hop);
% disp('Maxhop=');
% disp(Maxhop);

end