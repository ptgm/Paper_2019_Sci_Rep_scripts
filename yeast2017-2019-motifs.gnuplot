set terminal pdf
set output "yeast2017-2019-motifs.pdf"
set tics font ",9" rotate by 35 right

x = 13
set ytics nomirror
set xtics nomirror 1,1,x
set xrange [0:x+1]
set key bottom right

set ylabel "Normalised Z-score" offset 2.7,0
set arrow 1 from 0,0 to (x+1),0 nohead

plot 'yeast2017-2019-motifs.data' using 1:2 w lp lw 2 ps 0.3 pt 5 dt 2 lt rgb "#AA6E28" title "2017 - B \\& E - Stress",\
     'yeast2017-2019-motifs.data' using 1:3 w lp lw 2 ps 0.3 pt 7 dt 2 lt rgb "#888888" title "2017 - B \\& E - Control",\
     'yeast2017-2019-motifs.data' using 1:4 w lp lw 2 ps 0.3 pt 5 lt rgb "#AA6E28" title "2019 - B \\& E - Stress",\
     'yeast2017-2019-motifs.data' using 1:5 w lp lw 2 ps 0.3 pt 7 lt rgb "#888888" title "2019 - B \\& E - Control"

# Subgraph	Stress2017	Control2017	Stress2019	Control2019
