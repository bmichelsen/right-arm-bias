#set terminal png nocrop enhanced font arial 8 size 420,320 
set term postscript eps enhanced color
set output 'eps/motion_all_not_n.eps'
set datafile missing '-'
#set title "All techniques by motion type except normal motion" 
set style data linespoints

plot 'dat/motion_all_not_n.dat' using 2:xtic(1) title columnheader(2), for [i=3:14] '' using i title columnheader(i)
