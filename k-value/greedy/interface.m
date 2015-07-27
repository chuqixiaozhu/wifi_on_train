function interface(loop_max)

if nargin < 1
    loop_max = 1000;
end
global gH;
global gtotallostpacketradio;
global gtotalmovepacketradio;

time = datestr(now, 'yyyymmdd-HHMMSS');
system(['mkdir ', time]);

flow_avg = 100;
bandwidth_avg = 100;
gk = 20;

lost_file = fopen('k-greedy_vs_lost.txt', 'w');
move_file = fopen('k-greedy_vs_move.txt', 'w');
hop_file = fopen('k-greedy_vs_hop.txt', 'w');
fprintf('Please wait');
for gk = 15:25
    greedy(flow_avg, bandwidth_avg, gk, loop_max);
    lost = sum(gtotallostpacketradio) / loop_max;
    move = sum(gtotalmovepacketradio) / loop_max;
    hop = sum(gH) / loop_max;
    fprintf(lost_file, '%d %f\n', gk, lost * 100);
    fprintf(move_file, '%d %f\n', gk, move * 100);
    fprintf(hop_file, '%d %f\n', gk, hop);
    fprintf('.');
end
fprintf('\n');

fclose(lost_file);
fclose(move_file);
fclose(hop_file);

system(['move ', 'k-greedy_vs_lost.txt ', time]);
system(['move ', 'k-greedy_vs_move.txt ', time]);
system(['move ', 'k-greedy_vs_hop.txt ', time]);

%system(['copy ', 'plot.gp ', time]);
%cd(time)
%system(['gnuplot plot.gp']);
%cd ..