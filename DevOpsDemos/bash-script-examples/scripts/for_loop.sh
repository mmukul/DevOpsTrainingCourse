#!/bin/bash

## examples of for loop
# Example:1

for var in 10 20 30 40 50
do
    echo $var
done


### ==================================
# Example:2

for a in $(seq 1 1 10)
do
    echo $a
done


### ==================================
# Example:3

for b in {1..10}
do
    echo $b
done

### ==================================
# Example:4

seq=(10 20 30 40 50)
for c in ${seq[@]}
do
    echo $c
done


