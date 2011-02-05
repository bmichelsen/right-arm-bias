set term postscript eps enhanced color
set output 'eps/stances_left.eps'
set datafile missing '-'
#set title "Left techniques by stances" 
set style data linespoints

plot 'dat/stances_left.dat' using 2:xtic(1) title columnheader(2), for [i=3:15] '' using i title columnheader(i)
