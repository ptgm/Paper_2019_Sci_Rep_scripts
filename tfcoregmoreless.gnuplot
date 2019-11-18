set terminal pdf 
set output ARG1

set xtics nomirror
set ytics nomirror
set xtics rotate
set x2tics
set tics font ",9"
set xrange [-1:25+0.5]
set yrange [0:100]
set xlabel "TFs" offset 0,1.2
set ylabel "% co-regulations" offset 3.2,0
set nokey

set style data histograms
set style histogram rowstacked
set boxwidth 0.5 
set style fill solid 1.0 border 0

plot ARG2 using 3:xtic(1)  t "0-0",\
     ""   using 4:xtic(1)  t "1-4",\
		 ""   using 5:xtic(1)  t "5-9",\
		 ""   using 6:xtic(1)  t "10-14",\
		 ""   using 7:x2tic(2) t "15-19"
