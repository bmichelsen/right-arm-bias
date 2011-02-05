set term postscript eps enhanced color
set output 'eps/patterns_all.eps'
set datafile missing '-'
#set title "All techniques by patterns" 
set style data linespoints

plot 'dat/patterns_all.dat' using 2:xtic(1) title columnheader(2), for [i=3:16] '' using i title columnheader(i)
