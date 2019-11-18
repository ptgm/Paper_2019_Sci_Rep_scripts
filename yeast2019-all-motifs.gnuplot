set terminal pdf
set output "yeast2019-all-motifs.pdf"
set tics font ",9" rotate by 35 right

x = 13
set ytics nomirror
set xtics nomirror 1,1,x
set xrange [0:x+1]
set key bottom right

set ylabel "Normalised Z-score" offset 2.7,0
set arrow 1 from 0,0 to (x+1),0 nohead

plot 'yeast2019-all-motifs.data' using 1:2 w lp lw 2 ps 0.5 pt 6 lc rgb "#87cefa" title "Yeastract - B",\
     'yeast2019-all-motifs.data' using 1:3 w lp lw 2 ps 0.5 pt 8 lc rgb "#ffa500" title "Yeastract - B \\& E",\
     'yeast2019-all-motifs.data' using 1:4 w lp lw 2 ps 0.5 pt 12 lc rgb "#ffff00" title "Balaji - B",\
     'yeast2019-all-motifs.data' using 1:5 w lp lw 2 ps 0.5 pt 10 lc rgb "#0000cd" title "Costanzo - B"

#plot 'yeast2019-all-motifs.data' using 1:2 w lp lw 2 ps 0.5 pt 14 lc rgb "#800080" title "Yeastract - B | E",\
#     'yeast2019-all-motifs.data' using 1:4 w lp lw 2 ps 0.5 pt 16 lc rgb "#00c000" title "Yeastract - E",\
# Subgraph	B-E	B	E	BE	Balaji	Costanzo	B-Balaji

