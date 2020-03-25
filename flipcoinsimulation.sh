#!/bin/bash

echo "*******welcome to flip coin simulation program*******"
echo ""
echo "this will show you winning percentage of head or tail"
echo "     combinaton in a singlet doublet or triplet"
 
declare -A toss

for ((i=1;i<=10;i++))
do
	if [ $(($RANDOM%10+1)) -le 5 ]
	then 
		toss="H"		
		tossresult[i]=$toss		
	else
		toss="T"		
		tossresult[i]=$toss	
	fi
done

#displaying output of total flips
echo ${!tossresult[@]}
echo ${tossresult[@]}

#calculating percentage of flips
n=${#tossresult[@]}
headcount=0;
tailcount=0;
for ((i=1;i<=$n;i++))
do
	if [ ${tossresult[i]} == "H" ]
	then
		((headcount++))
	else
		((tailcount++))
	fi
done

echo "Head %: "
echo "scale=4;$(($(($headcount*100))/${#tossresult[@]}))" | bc
echo "Tail %: "
echo "scale=4;$(($(($tailcount*100))/${#tossresult[@]}))" | bc








