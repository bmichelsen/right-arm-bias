#set terminal png nocrop enhanced font arial 8 size 420,320 
set term postscript eps enhanced color
set output 'eps/motion_left.eps'
set datafile missing '-'
#set title "Left techniques by motion type" 
set style data linespoints

plot 'dat/motion_left.dat' using 2:xtic(1) title columnheader(2), for [i=3:15] '' using i title columnheader(i)
