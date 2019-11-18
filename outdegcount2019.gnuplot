set terminal pdf
set output "outdegcount2019.pdf"
set xtics nomirror
set ytics nomirror
#set xrange[-20:*]
#set yrange[1:200]
set tics font ",9" rotate by 35 right
set logscale y
set xlabel "TFs" offset 0,1
set ylabel "Out-degree" offset 2.2,0

plot 'yeast2019-B-E-net.outdegcount' using 1:2 pt 7 ps 0.2 title "Yeastract - B U E",\
     'yeast2019-B-net.outdegcount'   using 1:2 pt 7 ps 0.2 title "Yeastract - B",\
     'yeast2019-E-net.outdegcount'   using 1:2 pt 7 ps 0.2 title "Yeastract - E",\
     'yeast2019-BE-net.outdegcount'  using 1:2 pt 7 ps 0.2 title "Yeastract - B \\& E"

