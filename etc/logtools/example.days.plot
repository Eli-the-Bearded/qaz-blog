et title "bytes per day"
set terminal png
set output 'logbytes.png'

# specify how to parse time from file
set timefmt '%d/%b/%Y'

# x-axis is time based (dates are time)
set xdata time
set xrange ["01/Jan/2020":"10/Jun/2020"]

# use American style dates for label, rotated so they don't overlap.
# in 4.2, "rotate by 90" puts the label under the axis, in 5.x
# rotate by -90 does
set xtics format '%b %d' rotate by -90

set arrow from "28/May/2020", 4e8 to "28/May/2020",8e8   nohead front ls
2
set label 1 'sitemap added' at "25/May/2020",4.9e8  rotate by 90 center
tc ls 2

# don't bother labeling lines ("unset key" is the old way to do this)
set nokey

# days.qaz has three columns:
#       1 date        2 bytes        3 annotations
plot "days.qaz" using 1:2 with lines
