function interface(loop_max)

if nargin < 1
    loop_max = 1000;
end
global rhH;
global rhtotallostpacketradio;
global rhtotalmovepacketradio;

time = datestr(now, 'yyyymmdd-HHMMSS');
system(['mkdir ', time]);

flow_avg = 100;
bandwidth_avg = 100;
rhk = 20;

lost_file = fopen('k-righthand_vs_lost.txt', 'w');
move_file = fopen('k-righthand_vs_move.txt', 'w');
hop_file = fopen('k-righthand_vs_hop.txt', 'w');
fprintf('Please wait');
for rhk = 15:25
    righthand(flow_avg, bandwidth_avg, rhk, loop_max);
    lost = sum(rhtotallostpacketradio) / loop_max;
    move = sum(rhtotalmovepacketradio) / loop_max;
    hop = sum(rhH) / loop_max;
    fprintf(lost_file, '%d %f\n', rhk, lost * 100);
    fprintf(move_file, '%d %f\n', rhk, move * 100);
    fprintf(hop_file, '%d %f\n', rhk, hop);
    fprintf('.');
end
fprintf('\n');

fclose(lost_file);
fclose(move_file);
fclose(hop_file);

system(['move ', 'k-righthand_vs_lost.txt ', time]);
system(['move ', 'k-righthand_vs_move.txt ', time]);
system(['move ', 'k-righthand_vs_hop.txt ', time]);

%system(['copy ', 'plot.gp ', time]);
%cd(time)
%system(['gnuplot plot.gp']);
%cd ..