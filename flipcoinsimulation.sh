#!/bin/bash

echo "*******welcome to flip coin simulation program*******"
echo ""
echo "this will show you winning percentage of head or tail"
echo "     combinaton in a singlet doublet or triplet"

if [ $(($RANDOM%10+1)) -le 5 ]
then 
	echo "head"
else
	echo "tail"
fi















