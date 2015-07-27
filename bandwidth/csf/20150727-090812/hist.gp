set terminal postscript eps color solid font "Times New Roman, 24"
#set terminal emf color solid enhanced font "Times New Roman, 20"

set style data histogram
set style histogram clustered gap 1
set style fill transparent solid 0.5 border
set output "flow_vs_lost-h.eps"
set xlabel "Number of Flows"
#set xrange [89:101]
#set xtics 1
#set mxtics 1
#set ylabel "{/SimSun=20 ¨®DD¡ì?¨¤2a¨º¡À???¨º (%)}"
set ylabel "Packet Loss Rate (%)"
set yrange [0:6]
set ytics 1
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
set key left top at -0.8, 5.8
#set boxwidth 0.5 relative
#plot "flow-csf_vs_lost.txt" u 2:xtic(1) w boxes title "CSF", \
     "flow-greedy_vs_lost.txt" u 2:xtic(1) w boxes title "Greedy", \
     "flow-righthand_vs_lost.txt" u 2:xtic(1) w boxes title "Righthand", \
     "flow-raw_vs_lost.txt" u 2:xtic(1) w boxes title "Raw"
#plot "flow-csf_vs_lost.txt" u 2:xtic(1) w histogram title "CSF", \
     "flow-greedy_vs_lost.txt" u 2:xtic(1) w histogram title "Greedy", \
     "flow-righthand_vs_lost.txt" u 2:xtic(1) w histogram title "Righthand", \
     "flow-raw_vs_lost.txt" u 2:xtic(1) w histogram title "Raw"
#plot "flow-csf_vs_lost.txt" u 2 w histogram title "CSF", \
     "flow-greedy_vs_lost.txt" u 2 w histogram title "Greedy", \
     "flow-righthand_vs_lost.txt" u 2 w histogram title "Righthand", \
     "flow-raw_vs_lost.txt" u 2 w histogram title "Raw"
plot "flow-csf_vs_lost.txt" u 2:xtic(1) title "CSF", \
     "flow-greedy_vs_lost.txt" u 2:xtic(1) title "Greedy", \
     "flow-righthand_vs_lost.txt" u 2:xtic(1) title "Righthand", \
     "flow-raw_vs_lost.txt" u 2:xtic(1) title "Raw"
set output