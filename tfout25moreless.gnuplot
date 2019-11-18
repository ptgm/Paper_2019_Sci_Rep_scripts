set terminal pdf
set output ARG1

set xtics nomirror
set ytics nomirror
set xtics font ",9" rotate by 35 right
set ytics font ",9"
set yrange [0:*]
set xlabel "Transcription factor" offset 0,1
set ylabel "Out degree" offset 2.2,0

set style fill solid 1.00 border 0
set style data histogram

plot ARG2 using 2:xticlabels(1) notitle

