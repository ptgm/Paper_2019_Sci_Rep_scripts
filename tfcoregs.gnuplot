set terminal pdf 
set output ARG1

set xtics nomirror
set ytics nomirror
set tics font ",12"
set xlabel "# TGs" offset 0,0.3
set ylabel "# Co-regulators" offset 1.7,0
set nokey
#set xrange [0:300]

#plot "yeast-B-E-net.tfcoregs"    using 1:2 w p pt 7 ps 0.3 title "Yeastract - B U E",\
#     "yeast-E-net.tfcoregs"      using 1:2 w p pt 7 ps 0.3 title "Yeastract - E",\
#     "yeast-B-net.tfcoregs"      using 1:2 w p pt 7 ps 0.3 title "Yeastract - B",\
#     "yeast-BE-net.tfcoregs"     using 1:2 w p pt 7 ps 0.3 title "Yeastract - B \\& E",\
#     "Balaji_dataset.tfcoregs"   using 1:2 w p pt 7 ps 0.3 title "Balaji - B",\
#		  "Costanzo_dataset.tfcoregs" using 1:2 w p pt 7 ps 0.3 title "Costanzo - B"

set arrow from 0,ARG2, graph 0 to ARG3,ARG2, graph 1 nohead dt 2
plot ARG4 using 1:2 w p pt 7 ps 0.3 lt rgb "#000000" notitle
