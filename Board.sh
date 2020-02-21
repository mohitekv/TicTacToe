#!/bin/bash 

declare -A board
#Tic Tac toe board
for ((i=0;i<3;i++))
do
        for ((j=0;j<3;j++))
        do
                board[$i,$j]="-"
        done
done

for ((i=0;i<3;i++))
do
    for ((j=0;j<3;j++))
    do
        echo -ne "${board[${i},${j}]}"
    done
   echo -e "\n" 
done


