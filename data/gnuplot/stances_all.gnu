set term postscript eps enhanced color
set output 'eps/stances_all.eps'
set datafile missing '-'
#set title "All techniques by stances" 
set style data linespoints

plot 'dat/stances_all.dat' using 2:xtic(1) title columnheader(2), for [i=3:4] '' using i title columnheader(i)
