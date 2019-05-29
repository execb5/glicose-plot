`curl 'https://docs.google.com/spreadsheets/d/1rgUTX_90dFgdIWYj5lfooY2q8WEZfxmD6D78DsB6sew/export?exportFormat=csv' > glicose.csv`

set terminal pngcairo size 12000,2000 enhanced background rgb "#ffffff" font 'Arial,16'

set output 'glicose.png'
set timefmt '%Y-%m-%d %H:%M'
set format x "%d-%m\n%H:%M"
set xdata time
set datafile separator ","
set xlabel "Date Time"
set ylabel "Glicose Level"
set grid

set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5

plot 'glicose.csv' using 1:2 with linespoints linestyle 1, \
    'glicose.csv' using 1:2:(sprintf("%d", $2)) with labels point pt 7 offset char 1,1 notitle

`rm glicose.csv`
