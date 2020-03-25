#!/bin/bash

echo "*******welcome to flip coin simulation program*******"
echo ""
echo "this will show you winning percentage of head or tail"
echo "     combinaton in a singlet doublet or triplet"
 
#declare -A tossresult

for ((i=1;i<=10;i++))do	
	doublet=$(($RANDOM%100+1))
	if [ $doublet -le 25 ]
	then 
		toss="HH"		
		tossresult[$i]=$toss	
	elif [ $doublet -gt 25 ] && [ $doublet -le 50 ]
	then
		toss="HT"		
		tossresult[$i]=$toss
	elif [ $doublet -gt 50 ] && [ $doublet -le 75 ]
	then		
		toss="TH"		
		tossresult[$i]=$toss
	else
		toss="TT"		
		tossresult[$i]=$toss	
	fi
done

#displaying output of total flips
echo ${!tossresult[@]}
echo ${tossresult[@]}

#calculating percentage of flips
n=${#tossresult[@]}
HHcount=0;
HTcount=0;
THcount=0;
TTcount=0;
TH
for ((i=1;i<=$n;i++))
do
	if [ ${tossresult[i]} == "HH" ] 
	then
		((HHcount++))
	elif [ ${tossresult[i]} == "HT" ] 
	then
		((HTcount++))
	elif [ ${tossresult[i]} == "TH" ] 
	then
		((THcount++))
	else
		((TTcount++))
	fi
done

#calculating percentage:
echo "HH%: "$(($(($HHcount*100))/${#tossresult[@]}))
echo "HT%: "$(($(($HTcount*100))/${#tossresult[@]}))
echo "TH%: "$(($(($THcount*100))/${#tossresult[@]}))
echo "TT%: "$(($(($TTcount*100))/${#tossresult[@]}))






