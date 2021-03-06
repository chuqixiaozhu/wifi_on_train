#set terminal pdfcairo enhanced font "Times New Roman, 20"
#set output "20_m_num_vs_vt.pdf"
set terminal postscript eps color solid font "Times New Roman, 24"
#set terminal postscript eps color solid
#set terminal emf color solid enhanced font "Times New Roman, 20"
#set samples 1000
set output "flow_vs_lost.eps"
#set terminal qt font "Times New Roman, 20"
#set xlabel "{/SimSun=20 空洞数量}"
set xlabel "Number of Flows"
set xrange [10:20]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
set ylabel "Packet Loss Rate (%)"
set yrange [0:5]
set ytics 1
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key left top at 1.2, 2.4
plot "flow-csf_vs_lost.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF", \
     "flow-greedy_vs_lost.txt" w lp lt 2 lw 2 pt 2 ps 2 title "Greedy", \
     "flow-righthand_vs_lost.txt" w lp lt 3 lw 2 pt 3 ps 2 title "Righthand"
set output

set output "flow_vs_move.eps"
set xlabel "Number of Flows"
set xrange [10:20]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
set ylabel "Packet Move Rate (%)"
set yrange [0:40]
set ytics 10
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key left top at 1.2, 14.5
plot "flow-csf_vs_move.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF", \
     "flow-greedy_vs_move.txt" w lp lt 2 lw 2 pt 2 ps 2 title "Greedy", \
     "flow-righthand_vs_move.txt" w lp lt 3 lw 2 pt 3 ps 2 title "Righthand"
set output

set output "flow_vs_hop.eps"
set xlabel "Number of Flows"
set xrange [10:20]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
set ylabel "Maximum Shifting Hop"
set yrange [0:10]
set ytics 2
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key left top at 1.2, 9.8
plot "flow-csf_vs_hop.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF", \
     "flow-greedy_vs_hop.txt" w lp lt 2 lw 2 pt 2 ps 2 title "Greedy", \
     "flow-righthand_vs_hop.txt" w lp lt 3 lw 2 pt 3 ps 2 title "Static"
set output

set style data histogram
set style histogram clustered gap 1
set style fill transparent solid 0.5 border
set output "flow_vs_lost-h.eps"
set xlabel "Number of Flows"
set xrange [-1:11]
#set xtics 1
#set mxtics 1
#set ylabel "{/SimSun=20 ¨?DD?ì?¨¤2a¨o?à???¨o (%)}"
set ylabel "Packet Loss Rate (%)"
set yrange [0:16]
set ytics 4
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key left top at -0.8, 5.8
#set boxwidth 0.5 relative
plot "flow-csf_vs_lost.txt" u 2:xtic(1) title "CSF", \
     "flow-greedy_vs_lost.txt" u 2:xtic(1) title "Greedy", \
     "flow-righthand_vs_lost.txt" u 2:xtic(1) title "Righthand", \
     "flow-raw_vs_lost.txt" u 2:xtic(1) title "Raw"
set output