free | grep Mem | \
       awk '{ printf("%.0f%", $3/$2 * 100) }'
