#!/bin/bash 


declare -A board
player="X"
playerTurn()
{
        toss=$((RANDOM%2))
        case $toss in
        0)
                echo "Player lose the toss"
                ;;
        *)      
                echo "Player wins the toss"
                ;;
        esac    
}
read -p "Choose "X" or "O" :" player
        case $player in
        "X")
                other="O"
                ;;
        "O")
                other="X"
                ;;
        *)
                echo "wrong input"
                ;;
        esac

playerTurn

