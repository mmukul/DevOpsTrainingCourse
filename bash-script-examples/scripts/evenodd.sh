#!/usr/bin/env bash
echo -n "Enter The Number: "
read -r n
if [ $((n % 2)) -eq 0 ]; then
	echo "Number is a Even Number"
else
	echo "Number is a odd Number"
fi
