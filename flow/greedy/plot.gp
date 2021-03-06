#set terminal pdfcairo enhanced font "Times New Roman, 20"
#set output "20_m_num_vs_vt.pdf"
#set terminal postscript eps color solid font "Times New Roman, 20"
set terminal postscript eps color solid
#set terminal emf color solid enhanced font "Times New Roman, 20"
set output "flow_vs_lost.eps"
#set terminal qt font "Times New Roman, 20"
#set xlabel "{/SimSun=20 空洞数量}"
set xlabel "Number of Flows"
set xrange [90:110]
set xtics 2
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
set ylabel "Packet Loss Rate (%)"
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
plot "flow-csf_vs_lost.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF"
     #"d_fov-m_vs_emt" w lp lt 2 lw 2 pt 2 ps 2 title "Direct", \
     #"d_fov-s_vs_emt" w lp lt 3 lw 2 pt 3 ps 2 title "Static"
set output

set output "flow_vs_move.eps"
set xlabel "Number of Flows"
set xrange [90:110]
set xtics 2
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
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
plot "flow-csf_vs_move.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF"
     #"d_fov-m_vs_emt" w lp lt 2 lw 2 pt 2 ps 2 title "Direct", \
     #"d_fov-s_vs_emt" w lp lt 3 lw 2 pt 3 ps 2 title "Static"
set output

set output "flow_vs_hop.eps"
set xlabel "Number of Flows"
set xrange [90:110]
set xtics 2
set mxtics 1
#set ylabel "{/SimSun=20 有效监测时间率 (%)}"
set ylabel "Maximum Shifting Hop"
set yrange [0:5]
set ytics 1
set mytics 1
set format y "%.2f"
set grid
set key box
set key Left
#set key width 10
#set key spacing 10
#set key right top at 4.93, 78.2
plot "flow-csf_vs_hop.txt" w lp lt 1 lw 2 pt 5 ps 2 title "CSF"
     #"d_fov-m_vs_emt" w lp lt 2 lw 2 pt 2 ps 2 title "Direct", \
     #"d_fov-s_vs_emt" w lp lt 3 lw 2 pt 3 ps 2 title "Static"
set output