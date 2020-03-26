#!/bin/bash

echo "*******welcome to flip coin simulation program*******"
echo ""
echo "this will show you winning percentage of head or tail"
echo "     combinaton in a singlet doublet or triplet"
 
#declare -A tossresult

for ((i=1;i<=100;i++))do	
	doublet=$(($RANDOM%1000+1))
	if [ $doublet -le 125 ]
	then 
		toss="HHH"		
		tossresult[$i]=$toss	
	elif [ $doublet -gt 125 ] && [ $doublet -le 250 ]
	then
		toss="HHT"		
		tossresult[$i]=$toss
	elif [ $doublet -gt 250 ] && [ $doublet -le 375 ]
	then		
		toss="HTH"		
		tossresult[$i]=$toss
	elif [ $doublet -gt 375 ] && [ $doublet -le 500 ]
	then		
		toss="HTT"		
		tossresult[$i]=$toss
	elif [ $doublet -gt 500 ] && [ $doublet -le 625 ]
	then		
		toss="THH"		
		tossresult[$i]=$toss
	elif [ $doublet -gt 625 ] && [ $doublet -le 750 ]
	then		
		toss="THT"		
		tossresult[$i]=$toss
	elif [ $doublet -gt 750 ] && [ $doublet -le 875 ]
	then		
		toss="TTH"		
		tossresult[$i]=$toss
	else
		toss="TTT"		
		tossresult[$i]=$toss	
	fi
done

#displaying output of total flips
echo ${!tossresult[@]}
echo ${tossresult[@]}

#calculating percentage of flips
n=${#tossresult[@]}
HHHcount=0;
HHTcount=0;
HTHcount=0;
HTTcount=0;
THHcount=0;
THTcount=0;
TTHcount=0;
TTTcount=0;
for ((i=1;i<=$n;i++))
do
	if [ ${tossresult[i]} == "HHH" ] 
	then
		((HHHcount++))
	elif [ ${tossresult[i]} == "HHT" ] 
	then
		((HHTcount++))
	elif [ ${tossresult[i]} == "HTH" ] 
	then
		((HTHcount++))
	elif [ ${tossresult[i]} == "HTT" ] 
	then
		((HTTcount++))
	elif [ ${tossresult[i]} == "THH" ] 
	then
		((THHcount++))
	elif [ ${tossresult[i]} == "THT" ] 
	then
		((THTcount++))
	elif [ ${tossresult[i]} == "TTH" ] 
	then
		((TTHcount++))
	else
		((TTTcount++))
	fi
done

#calculating percentage:
echo "HHH%: "$(($(($HHHcount*100))/${#tossresult[@]}))
echo "HHT%: "$(($(($HHTcount*100))/${#tossresult[@]}))
echo "HTH%: "$(($(($HTHcount*100))/${#tossresult[@]}))
echo "HTT%: "$(($(($HTTcount*100))/${#tossresult[@]}))
echo "THH%: "$(($(($THHcount*100))/${#tossresult[@]}))
echo "THT%: "$(($(($THTcount*100))/${#tossresult[@]}))
echo "TTH%: "$(($(($TTHcount*100))/${#tossresult[@]}))
echo "TTT%: "$(($(($TTTcount*100))/${#tossresult[@]}))

#DICTIONARY BASED MODIFICATIONS NEEDED
#BASH NOT SUPPORTING DICTIONARY



