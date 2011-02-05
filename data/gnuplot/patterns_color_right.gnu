set term postscript eps enhanced color
set output 'eps/patterns_color_right.eps'
set datafile missing '-'
#set title "Right techniques by color belt patterns" 
set style data linespoints

plot 'dat/patterns_color_right.dat' using 2:xtic(1) title columnheader(2), for [i=3:10] '' using i title columnheader(i)
