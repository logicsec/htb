free | grep Mem | \
       awk '{ printf("%.0f%", $4/$2 * 100) }'
