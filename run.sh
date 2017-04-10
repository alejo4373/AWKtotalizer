#! /bin/bash

Fetch https://freebread.manifesthq.com/admin/orders/select_for_picking
echo "################# -Fetching Realeased Manifest- #################"
curl/getpage.sh

echo "###### -GAWK pocessing HTML code from select_for_picking- #######"
echo "1st step"
./trimmer.awk  select_for_picking.html > trimmed.txt

echo "2nd step"
./organizer.awk trimmed.txt > organized.txt

echo "Final step and...."

dat=$(date | awk '{print $2"-"$3"-"substr($6,length($6)-1)}')
./csvGenerator.awk organized.txt > totalizer-$dat.csv

echo "FINISHED"
