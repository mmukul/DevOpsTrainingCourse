#!/bin/bash

function array()
{

echo "Number of arguments are:$#"
echo "Array Elements are ${a[@]}"

}
a=(10 39 56 48)
array $a
