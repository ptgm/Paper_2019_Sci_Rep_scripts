set terminal pdf
set output "indegdist2019.pdf"
set xtics nomirror
set ytics nomirror
set xrange[1:160]
#set yrange[1:200]
set tics font ",9" rotate by 35 right
set logscale x
set xlabel "In-degree" offset 0,1
set ylabel "# Genes" offset 2.2,0

plot 'yeast2019-B-E-net.indegdist'    using 1:2 w lp lw 2 ps 0.3 pt 14 lc rgb "#9400d3" title "Yeastract - B | E",\
     'yeast2019-E-net.indegdist'      using 1:2 w lp lw 2 ps 0.3 pt 16 lc rgb "#00c000" title "Yeastract - E",\
     'yeast2019-B-net.indegdist'      using 1:2 w lp lw 2 ps 0.3 pt  6 lc rgb "#87cefa" title "Yeastract - B",\
     'yeast2019-BE-net.indegdist'     using 1:2 w lp lw 2 ps 0.3 pt  8 lc rgb "#ffa500" title "Yeastract - B \\& E",\
		 'Balaji_dataset.indegdist'   using 1:2 w lp lw 2 ps 0.3 pt 12 lc rgb "#ffff00" title "Balaji - B",\
		 'Costanzo_dataset.indegdist' using 1:2 w lp lw 2 ps 0.3 pt 10 lc rgb "#0000cd" title "Costanzo - B"

