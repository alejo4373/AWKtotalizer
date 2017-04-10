#! /usr/bin/gawk -f 

BEGIN{FS="\n"; RS=">";OFS=",";ORS="\n"}
NR>1{$1=$1; print $0}

