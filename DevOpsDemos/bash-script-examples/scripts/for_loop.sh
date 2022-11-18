#!/bin/bash

## examples of for loop in C language
for var in 10 20 30 40 50
do
    echo $var
done


### ==================================

for a in $(seq 1 1 10)
do
    echo $a
done


### ==================================

for b in {1..10}
do
    echo $b
done

### ==================================

seq=(10 20 30 40 50)
for c in ${seq[@]}
do
    echo $c
done



### =====================================================
## examples of for loop in Shell Script

for((a=1;a<10;a++))
do
    echo $a
done


