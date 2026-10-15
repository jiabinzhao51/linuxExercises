#!/bin/bash

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -f 7 |
    {
	sum = 0
	count = 0

	while read value
	do

	    sum = $(echo "$sum + $value")
	    count = $((count + 1))

	done

	echo "Sum: $sum"
	echo "Count: $count"
	echo "Average: $(($sum / $count))"
    }

