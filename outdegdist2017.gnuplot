set terminal pdf
set output "outdegdist2017.pdf"
set xtics nomirror
set ytics nomirror
set tics font ",9" rotate by 35 right
set xlabel "Out-degree" offset 0,1.0
set ylabel "# Transcription factors" offset 2.7,0

w = 200
set xtics w
set xrange [0:2600]

set boxw 0.12*w
set style fill solid 0.5 border 0
bin(x,w)= w*floor(x/w) + w/2.0

plot 'yeast2017-B-E-net.outdegdist'    u (bin($1,w)-w*0.35):2 smooth freq w boxes lc rgb "#9400d3" t "Yeastract - B | E",\
     'yeast2017-E-net.outdegdist'      u (bin($1,w)-w*0.20):2 smooth freq w boxes lc rgb "#00c000" t "Yeastract - E",\
     'yeast2017-B-net.outdegdist'      u (bin($1,w)-w*0.05):2 smooth freq w boxes lc rgb "#87cefa" t "Yeastract - B",\
     'yeast2017-BE-net.outdegdist'     u (bin($1,w)+w*0.10):2 smooth freq w boxes lc rgb "#ffa500" t "Yeastract - B \\& E",\
     'Balaji_dataset.outdegdist'   u (bin($1,w)+w*0.25):2 smooth freq w boxes lc rgb "#ffff00" t "Balaji - B",\
     'Costanzo_dataset.outdegdist' u (bin($1,w)+w*0.40):2 smooth freq w boxes lc rgb "#0000cd" t "Costanzo - B"
