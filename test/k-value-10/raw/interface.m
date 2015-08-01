function interface(loop_max)

if nargin < 1
    loop_max = 1000;
end
% global rH;
global rtotallostpacketradio;
% global rtotalmovepacketradio;

time = datestr(now, 'yyyymmdd-HHMMSS');
system(['mkdir ', time]);

flow_avg = 100;
bandwidth_avg = 100;
rk = 20;

lost_file = fopen('k-raw_vs_lost.txt', 'w');
% move_file = fopen('bandwidth-raw_vs_move.txt', 'w');
% hop_file = fopen('bandwidth-raw_vs_hop.txt', 'w');
fprintf('Please wait');
for rk = 15:25
    raw(flow_avg, bandwidth_avg, rk, loop_max);
    lost = sum(rtotallostpacketradio) / loop_max;
%     move = sum(rtotalmovepacketradio) / loop_max;
%     hop = sum(rH) / loop_max;
    fprintf(lost_file, '%d %f\n', rk, lost * 100);
%     fprintf(move_file, '%d %f\n', bandwidth_avg, move * 100);
%     fprintf(hop_file, '%d %f\n', bandwidth_avg, hop);
    fprintf('.');
end
fprintf('\n');

fclose(lost_file);
% fclose(move_file);
% fclose(hop_file);

system(['move ', 'k-raw_vs_lost.txt ', time]);
% system(['move ', 'k-raw_vs_move.txt ', time]);
% system(['move ', 'k-raw_vs_hop.txt ', time]);

%system(['copy ', 'plot.gp ', time]);
%cd(time)
%system(['gnuplot plot.gp']);
%cd ..