set terminal pdf
set output "indegcount2019.pdf"
set xtics nomirror
set ytics nomirror
#set xrange[-20:*]
set yrange[1:150]
set tics font ",9" rotate by 35 right
set logscale y
set xlabel "Number of genes" offset 0,1
set ylabel "In-degree" offset 2.2,0

plot 'yeast2019-B-E-net.indegcount'    using 1:2 w lp lw 2 ps 0.2 pt 7 title "Yeastract - B U E",\
     'yeast2019-E-net.indegcount'      using 1:2 w lp lw 2 ps 0.2 pt 7 title "Yeastract - E",\
     'yeast2019-B-net.indegcount'      using 1:2 w lp lw 2 ps 0.2 pt 7 title "Yeastract - B",\
     'yeast2019-BE-net.indegcount'     using 1:2 w lp lw 2 ps 0.2 pt 7 title "Yeastract - B \\& E",\
     'Balaji_dataset.indegcount'   using 1:2 w lp lw 2 ps 0.2 pt 7 title "Balaji - B",\
     'Costanzo_dataset.indegcount' using 1:2 w lp lw 2 ps 0.2 pt 7 title "Costanzo - B"

