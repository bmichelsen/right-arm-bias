set term postscript eps enhanced color
set output 'eps/patterns_right.eps'
set datafile missing '-'
#set title "Right techniques by patterns" 
set style data linespoints

plot 'dat/patterns_right.dat' using 2:xtic(1) title columnheader(2), for [i=3:16] '' using i title columnheader(i)
