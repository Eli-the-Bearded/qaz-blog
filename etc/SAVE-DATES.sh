#!/bin/sh
export SLS_DATEFMT=%Y%m%d%H%M.%S
datadir=$PHTML/qz/data
savefile=$PHTML/qz/etc/FIX-DATES

# use sls to make shell commands to reset date/time on files
slsoutstyle='touch -t %m %n'
find "$datadir" -type f -exec sls -p "$slsoutstyle" {} + > "$savefile"

# any time I save dates, probably want to rebuild sitemap
$HOME/scripts/completemap.sh

