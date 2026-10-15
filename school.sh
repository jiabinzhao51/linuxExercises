#!/bin/bash

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f 7 |
    {
	sum=0
	count=0

	while read value
	do

	    sum=$(echo "$sum + $value" | bc)
	    count=$((count + 1))

	done

	average=$(echo "scale=2; $sum / $count" | bc)

	echo "Sum: $sum"
	echo "Count: $count"
	echo "Average: $average"
    }

