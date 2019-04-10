#! /bin/bash

DATA_FILE=glicose.csv
PLOT_OUTPUT="glicose.png"

curl 'https://docs.google.com/spreadsheets/d/1rgUTX_90dFgdIWYj5lfooY2q8WEZfxmD6D78DsB6sew/export?exportFormat=csv' > ${DATA_FILE}

gnuplot <<-EOF > "${PLOT_OUTPUT}"
	set terminal pngcairo size 2000,1000 enhanced background rgb "#ffffff" font 'Arial,16'

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

	plot '${DATA_FILE}' using 1:2 with linespoints linestyle 1
EOF
rm ${DATA_FILE}
