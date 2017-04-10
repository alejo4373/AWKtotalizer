#! /usr/bin/gawk -f

BEGIN{FS="(<|>)"; OFS=","} 

/order-name/ {print ">"$5","$7}
/td class="sku"/ {print $3}
/td class="required c"/ {print $3}
