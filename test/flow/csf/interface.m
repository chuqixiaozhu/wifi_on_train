function interface(loop_max)

if nargin < 1
    loop_max = 1000;
end
global H;
global totallostpacketradio;
global totalmovepacketradio;

time = datestr(now, 'yyyymmdd-HHMMSS');
system(['mkdir ', time]);

flow_avg = 10;
bandwidth_avg = 10;
k = 20;

lost_file = fopen('flow-csf_vs_lost.txt', 'w');
move_file = fopen('flow-csf_vs_move.txt', 'w');
hop_file = fopen('flow-csf_vs_hop.txt', 'w');
fprintf('Please wait');
for flow_avg = 1:10
    csf(flow_avg, bandwidth_avg, k, loop_max);
    lost = sum(totallostpacketradio) / loop_max;
    move = sum(totalmovepacketradio) / loop_max;
    hop = sum(H) / loop_max;
    fprintf(lost_file, '%d %f\n', flow_avg, lost * 100);
    fprintf(move_file, '%d %f\n', flow_avg, move * 100);
    fprintf(hop_file, '%d %f\n', flow_avg, hop);
    fprintf('.');
end
fprintf('\n');

fclose(lost_file);
fclose(move_file);
fclose(hop_file);

system(['move ', 'flow-csf_vs_lost.txt ', time]);
system(['move ', 'flow-csf_vs_move.txt ', time]);
system(['move ', 'flow-csf_vs_hop.txt ', time]);

%system(['copy ', 'plot.gp ', time]);
%cd(time)
%system(['gnuplot plot.gp']);
%cd ..