set terminal pdf 
set output "coreg2017.pdf"

set xtics nomirror
set ytics nomirror
x=80
set xrange [0:x]
set yrange [0:5300]
set tics font ",9"
set xtics 0,5,x
set xlabel "# Co-regulators" offset 0,0.7
set ylabel "# TFs" offset 2.7,0

plot "yeast2017-B-E-net.coregcounts"    u 1:2 w lp lw 2 ps 0.3 pt 7 lc rgb "#9400d3" t "Yeastract - B | E",\
     "yeast2017-E-net.coregcounts"      u 1:2 w lp lw 2 ps 0.3 pt 7 lc rgb "#00c000" t "Yeastract - E",\
		 "yeast2017-B-net.coregcounts"      u 1:2 w lp lw 2 ps 0.3 pt 7 lc rgb "#87cefa" t "Yeastract - B",\
		 "yeast2017-BE-net.coregcounts"     u 1:2 w lp lw 2 ps 0.3 pt 7 lc rgb "#ffa500" t "Yeastract - B \\& E",\
		 "Balaji_dataset.coregcounts"   u 1:2 w lp lw 2 ps 0.3 pt 7 lc rgb "#ffff00" t "Balaji - B",\
		 "Costanzo_dataset.coregcounts" u 1:2 w lp lw 2 ps 0.3 pt 7 lc rgb "#0000cd" t "Costanzo - B"

