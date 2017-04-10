#! /bin/bash

#Curl script to authenticate user and download source code from https://freebread.manifesthq.com/admin/orders/select_for_picking

#Define working directory
#auser="haroldo%40freebreadinc.com"
#apass="haro2323"


curl --cookie-jar cjar --output cookies.co https://freebread.manifesthq.com/login
curl --cookie cjar --cookie-jar cjar --data 'login=haroldo%40freebreadinc.com' --data 'password=Opera2323' --location --output loginresult.html https://freebread.manifesthq.com/login
curl --cookie cjar --output select_for_picking.html https://freebread.manifesthq.com/admin/orders/select_for_picking
