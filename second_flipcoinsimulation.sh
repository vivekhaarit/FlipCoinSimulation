#!/bin/bash

echo "*******welcome to flip coin simulation program*******"
echo ""
echo "this will show you winning percentage of head or tail"
echo "     combinaton in a singlet doublet or triplet"
echo "-----------------------------------------------------"

declare -A singletDictionary 
declare -A doubletDictionary
declare -A tripletDictionary
declare -A percentageOfAllCombination

SingletNature(){
    local i=$1;
    #storing H&T in singlet dictionary
    if [ $(($RANDOM%2)) -eq 0 ]
    then
        singletDictionary[$i]="H"       #storing value of the respective keys
    else
        singletDictionary[$i]="T"
    fi
}

DoubletNature(){
    local i=$1;
    #storing HH-TT in doublet dictionary
    if [ $(($RANDOM%4)) -eq 0 ]
    then
        doubletDictionary[$i]="HH"      #storing value of the respective keys
    elif [ $(($RANDOM%4)) -eq 1 ]
    then
        doubletDictionary[$i]="HT"
    elif [ $(($RANDOM%4)) -eq 2 ]
    then
        doubletDictionary[$i]="TH"
    elif [ $(($RANDOM%4)) -eq 3 ]
    then
        doubletDictionary[$i]="TT"
    fi
}

TripletNature(){
    local i=$1;
    if [ $(($RANDOM%8)) -eq 0 ]
    then
        tripletDictionary[$i]="HHH"     #storing value of the respective keys
    elif [ $(($RANDOM%8)) -eq 1 ]
    then
        tripletDictionary[$i]="HHT"
    elif [ $(($RANDOM%8)) -eq 2 ]
    then
        tripletDictionary[$i]="HTH"
    elif [ $(($RANDOM%8)) -eq 3 ]
    then
        tripletDictionary[$i]="HTT"
    elif [ $(($RANDOM%8)) -eq 4 ]
    then
        tripletDictionary[$i]="TTT"
    elif [ $(($RANDOM%8)) -eq 5 ]
    then
        tripletDictionary[$i]="THH"
    elif [ $(($RANDOM%8)) -eq 6 ]
    then
        tripletDictionary[$i]="THH"
    elif [ $(($RANDOM%8)) -eq 7 ]
    then
        tripletDictionary[$i]="HTT"
    fi
}

StartFlip(){
    local i
    for ((i=0;i<$1;i++))
    do
        SingletNature $i
        DoubletNature $i
        TripletNature $i
    done
}

SingletPercentage(){
    #receives dictionary
    local ar=("$@")
    local n=${#ar[@]}

    H_count=0;
    T_count=0;
    H_Percentage=0;
    T_Percentage=0;

    for i in "${ar[@]}"
    do
        if [ $i == "H" ]
        then 
            ((H_count++))
        else
            ((T_count++))
        fi
    done
    
    H_Percentage=$(echo "scale=2;$H_count*100/$n" | bc -l)
    echo "H% : "$H_Percentage"%"
    percentageOfAllCombination[H]=$H_Percentage

    T_Percentage=$(echo "scale=2;$T_count*100/$n" | bc -l)
    echo "T% : "$T_Percentage"%"
    percentageOfAllCombination[T]=$T_Percentage
}

DoubletPercentage(){
    #receives dictionary
    local ar=("$@")
    local n=${#ar[@]}

    HH_Count=0;
    HT_Count=0;
    TH_Count=0;
    TT_Count=0;
    HH_Percentage=0;
    HT_Percentage=0;
    TH_Percentage=0;
    TT_Percentage=0;

    for i in "${ar[@]}"
    do
        if [ $i == "HH" ]
        then 
            ((HH_count++))
        elif [ $i == "HT" ]
        then
            ((HT_count++))
        elif [ $i == "TH" ]
        then
            ((TH_count++))
        elif [ $i == "TT" ]
        then
            ((TT_count++))
        fi
    done
    
    HH_Percentage=$(echo "scale=2;$HH_count*100/$n" | bc -l)
    echo "HH% : "$HH_Percentage"%" 
    percentageOfAllCombination[HH]=$HH_Percentage 

    HT_Percentage=$(echo "scale=2;$HT_count*100/$n" | bc -l)
    echo "HT% : "$HT_Percentage"%"
    percentageOfAllCombination[HT]=$HT_Percentage
    
    TH_Percentage=$(echo "scale=2;$TH_count*100/$n" | bc -l)
    echo "TH% : "$TH_Percentage"%"
    percentageOfAllCombination[TH]=$TH_Percentage
    
    TT_Percentage=$(echo "scale=2;$TT_count*100/$n" | bc -l)
    echo "TT% : "$TT_Percentage"%"
    percentageOfAllCombination[TT]=$TT_Percentage
}

TripletPercentage(){
    #receives dictionary
    local ar=("$@")
    local n=${#ar[@]}

    HHH_Count=0;
    HHT_Count=0;
    HTH_Count=0;
    HTT_Count=0;
    THH_Count=0;
    THT_Count=0;
    TTH_Count=0;
    TTT_Count=0;
    HHH_Percentage=0;
    HHT_Percentage=0;
    HTH_Percentage=0;
    HTT_Percentage=0;
    THH_Percentage=0;
    THT_Percentage=0;
    TTH_Percentage=0;
    TTT_Percentage=0;

    for i in "${ar[@]}"
    do
        if [ $i == "HHH" ]
        then 
            ((HHH_count++))
        elif [ $i == "HHT" ]
        then
            ((HHT_count++))
        elif [ $i == "HTH" ]
        then
            ((HTH_count++))
        elif [ $i == "HTT" ]
        then
            ((HTT_count++))
        elif [ $i == "THH" ]
        then 
            ((THH_count++))
        elif [ $i == "THT" ]
        then
            ((THT_count++))
        elif [ $i == "TTH" ]
        then
            ((TTH_count++))
        else
            ((TTT_count++))
        fi
    done
    
    HHH_Percentage=$(echo "scale=2;$HHH_count*100/$n" | bc -l)
    echo "HHH% : "$HHH_Percentage"%"  
    percentageOfAllCombination[HHH]=$HHH_Percentage

    HHT_Percentage=$(echo "scale=2;$HHT_count*100/$n" | bc -l)
    echo "HHT% : "$HHT_Percentage"%"
    percentageOfAllCombination[HHT]=$HHT_Percentage
    
    HTH_Percentage=$(echo "scale=2;$HTH_count*100/$n" | bc -l)
    echo "HTH% : "$HTH_Percentage"%"
    percentageOfAllCombination[HTH]=$HTH_Percentage
    
    HTT_Percentage=$(echo "scale=2;$HTT_count*100/$n" | bc -l)
    echo "HTT% : "$HTT_Percentage"%"
    percentageOfAllCombination[HTT]=$HTT_Percentage

    THH_Percentage=$(echo "scale=2;$THH_count*100/$n" | bc -l)
    echo "THH% : "$THH_Percentage"%"  
    percentageOfAllCombination[THH]=$THH_Percentage

    THT_Percentage=$(echo "scale=2;$THT_count*100/$n" | bc -l)
    echo "THT% : "$THT_Percentage"%"
    percentageOfAllCombination[THT]=$THT_Percentage
    
    TTH_Percentage=$(echo "scale=2;$TTH_count*100/$n" | bc -l)
    echo "TTH% : "$TTH_Percentage"%"
    percentageOfAllCombination[TTH]=$TTH_Percentage
    
    TTT_Percentage=$(echo "scale=2;$TTT_count*100/$n" | bc -l)
    echo "TTT% : "$TTT_Percentage"%"
    percentageOfAllCombination[TTT]=$TTT_Percentage
}

read -p "How many times you want to flip the coin?" n

#start flip
StartFlip $n 

#show the singlet dictionary
echo ${!singletDictionary[@]}
echo ${singletDictionary[@]}
echo "------------------------"
SingletPercentage "${singletDictionary[@]}"
echo "------------------------"
echo ${!doubletDictionary[@]}
echo ${doubletDictionary[@]}
echo "------------------------"
DoubletPercentage "${doubletDictionary[@]}"
echo "------------------------"
echo ${!tripletDictionary[@]}
echo ${tripletDictionary[@]}
echo "------------------------"
TripletPercentage "${tripletDictionary[@]}"
echo "-------------------------"
echo ${percentageOfAllCombination[@]}
echo ${!percentageOfAllCombination[@]}

#you can't iterate on dictionary through index
#so getting the dictionary values in one array
percentageArray=(${percentageOfAllCombination[@]})
values=${#percentageArray[@]}

echo "writing to a file"            
echo ${percentageOfAllCombination[@]} > values.txt      #getting error
sort -g values.txt  

# for ((i = 0; i<$values; i++)) 
# do 
#     for((j=0; j<$values-$i-1; j++)) 
#     do
#         if [[ "${percentageArray[$j]}" -ge "${percentageArray[$(($j+1))]}" ]]
#         then
#             temp=0;
#             temp=${percentageArray[$j]} 
#             percentageArray[$j]=${percentageArray[$(($j+1))]}   
#             percentageArray[$(($j+1))]=$temp 
#         fi
#     done
# done
# winPercentage=${percentageArray[0]}
# echo $winPercentage
