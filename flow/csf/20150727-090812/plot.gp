#set terminal pdfcairo enhanced font "Times New Roman, 20"
#set output "20_m_num_vs_vt.pdf"
#set terminal postscript eps color solid font "Times New Roman, 20"
set terminal postscript eps color solid
#set terminal emf color solid enhanced font "Times New Roman, 20"
#set samples 1000
set output "flow_vs_lost.eps"
#set terminal qt font "Times New Roman, 20"
#set xlabel "{/SimSun=20 �ն�����}"
set xlabel "Number of Flows"
set xrange [90:100]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 ��Ч���ʱ���� (%)}"
set ylabel "Packet Loss Rate (%)"
set yrange [0:2.5]
set ytics 0.5
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key right top at 4.93, 78.2
plot "flow-csf_vs_lost.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF", \
     "flow-greedy_vs_lost.txt" w lp lt 2 lw 2 pt 2 ps 2 title "Greedy", \
     "flow-righthand_vs_lost.txt" w lp lt 3 lw 2 pt 3 ps 2 title "Righthand"
set output

set output "flow_vs_move.eps"
set xlabel "Number of Flows"
set xrange [90:100]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 ��Ч���ʱ���� (%)}"
set ylabel "Packet Move Rate (%)"
set yrange [0:15]
set ytics 3
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key right top at 4.93, 78.2
plot "flow-csf_vs_move.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF", \
     "flow-greedy_vs_move.txt" w lp lt 2 lw 2 pt 2 ps 2 title "Greedy", \
     "flow-righthand_vs_move.txt" w lp lt 3 lw 2 pt 3 ps 2 title "Righthand"
set output

set output "flow_vs_hop.eps"
set xlabel "Number of Flows"
set xrange [90:100]
set xtics 1
set mxtics 1
#set ylabel "{/SimSun=20 ��Ч���ʱ���� (%)}"
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
#set key right top at 4.93, 78.2
plot "flow-csf_vs_hop.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF", \
     "flow-greedy_vs_hop.txt" w lp lt 2 lw 2 pt 2 ps 2 title "Greedy", \
     "flow-righthand_vs_hop.txt" w lp lt 3 lw 2 pt 3 ps 2 title "Static"
set output