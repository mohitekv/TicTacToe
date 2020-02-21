#!/bin/bash 


declare -A board
player="X"
Startboard()
{
        #Tic Tac toe board
        for ((i=0;i<3;i++))
        do
                for ((j=0;j<3;j++))
                do
                        board[$i,$j]="-"
                done
        done    
}

display_board()
{
        echo "******************************************"
        for ((i=0;i<3;i++))
        do
                for ((j=0;j<3;j++))
                do
                        echo -ne "${board[$i,$j]}\t"
                done
        echo
        done
}
Startboard
display_board

