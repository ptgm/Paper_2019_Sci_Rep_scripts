set terminal pdf
set output "outdegordered2019.pdf"
set ytics nomirror
#set xrange[-20:*]
#set yrange[1:200]
set tics font ",11" rotate by 35 right
unset xtics
#set logscale y
set xlabel "Transcription factors" offset 0,-0.5
set ylabel "Out-degree" offset 1.1,0

plot 'yeast2019-B-E-net.outdegordered'    using 1:2 w lp lw 2 ps 0.3 pt 14 lc rgb "#9400d3" t "Yeastract - B | E",\
     'yeast2019-B-net.outdegordered'      using 1:2 w lp lw 2 ps 0.3 pt  6 lc rgb "#00c000" t "Yeastract - B",\
     'yeast2019-E-net.outdegordered'      using 1:2 w lp lw 2 ps 0.3 pt 16 lc rgb "#87cefa" t "Yeastract - E",\
     'yeast2019-BE-net.outdegordered'     using 1:2 w lp lw 2 ps 0.3 pt  8 lc rgb "#ffa500" t "Yeastract - B \\& E",\
     'Balaji_dataset.outdegordered'   using 1:2 w lp lw 2 ps 0.3 pt 12 lc rgb "#ffff00" t "Balaji - B",\
     'Costanzo_dataset.outdegordered' using 1:2 w lp lw 2 ps 0.3 pt 10 lc rgb "#0000cd" t "Costanzo - B"

