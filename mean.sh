#!/bin/bash
if [ $# -lt 1 ]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

file=${2:-/dev/stdin}

cut -d, -f$1 $file | tail -n +2 | {
    sum=0
    count=0
    while read x; do
        sum=$(echo "$sum + $x" | bc -l)
        count=$((count + 1))
    done
    echo "$sum / $count" | bc -l
}
