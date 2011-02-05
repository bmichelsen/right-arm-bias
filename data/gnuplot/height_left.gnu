#set terminal png nocrop enhanced font arial 8 size 420,320 
set term postscript eps enhanced color
set output 'eps/height_left.eps'
set datafile missing '-'
#set title "Left techniques by height" 
set style data linespoints

plot 'dat/height_left.dat' using 2:xtic(1) title columnheader(2), for [i=3:4] '' using i title columnheader(i)
