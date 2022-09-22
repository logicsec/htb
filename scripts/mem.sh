free | grep Mem | awk '{ printf("%.2f", $4/$2 * 100) }'
