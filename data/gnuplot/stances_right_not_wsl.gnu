set term postscript eps enhanced color
set output 'eps/stances_right_not_wsl.eps'
set datafile missing '-'
#set title "Right techniques by stances except walking, sitting and L" 
set style data linespoints

plot 'dat/stances_right_not_wsl.dat' using 2:xtic(1) title columnheader(2), for [i=3:12] '' using i title columnheader(i)
