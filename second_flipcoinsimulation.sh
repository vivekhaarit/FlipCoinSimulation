#!/bin/bash

echo "*******welcome to flip coin simulation program*******"
echo ""
echo "this will show you winning percentage of head or tail"
echo "     combinaton in a singlet doublet or triplet"
echo "-----------------------------------------------------"
declare -A singletDictionary 

StartFlip(){
    local i
    for ((i=0;i<$1;i++))
    do
        if [ $(($RANDOM%2)) -eq 0 ]
        then
            singletDictionary[$i]="H"
        else
            singletDictionary[$i]="T"
        fi
    done
}

SingletPercentage(){
    ar=("$@")
    n=${#ar[@]}
    headCount=0;
    tailCount=0;
    headPercentage=0;
    tailPercentage=0;

    for i in "${ar[@]}"
    do
        if [ $i == "H" ]
        then 
            ((headCount++))
        else
            ((tailCount++))
        fi
    done
    
    headPercentage=$(echo "scale=2;$headCount*100/$n" | bc -l)
    echo $headPercentage"%"
    
    tailPercentage=$(echo "scale=2;$tailCount*100/$n" | bc -l)
    echo $tailPercentage"%"
}

read -p "How many times you want to flip the coin?" n

#start flip
StartFlip $n

#show the singlet dictionary
echo ${!singletDictionary[@]}
echo ${singletDictionary[@]}

SingletPercentage "${singletDictionary[@]}"