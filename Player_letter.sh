#!/bin/bash 


declare -A board
player="X"
game()
{
        #Tic Tac toe board
        for ((i=0;i<3;i++))
        do
                for ((j=0;j<3;j++))
                do
                        board[$i,$j]="-"
                done
        done
        read -p "Choose "X" or "O" :" letter
        case $letter in
        "X")
                player="X"
                ;;
        "O")
                player="O"
                ;;
        *)
                echo "wrong input"
                ;;
        esac
}

game


