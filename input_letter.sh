#!/bin/bash 


declare -A board
player="X"
other="O"
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

player_turn()
{
        echo "Enter the value of row and column"
        read row
        read column
                if [[ ${board[$row,$column]} == "-" ]]
                then
                        board[$row,$column]=$player
                        display_board

                else
                        echo "Position Occupied Or Invalid Position For Computer!!"     
                fi
}

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


computer_turn()
{
        row=$((RANDOM%3))
        echo $row
        column=$((RANDOM%3))
        echo $column
                if [[ ${board[$row,$column]} == "-" ]]
                then
                        board[$row,$column]=$other
                        display_board

                else
                        echo "Position Occupied Or Invalid Position For Computer!!"     
                fi
}

toss()
{
        toss=$((RANDOM%2))
        case $toss in
        0)
                echo "Player lose the toss"
                computer_turn
                ;;
        *)      
                echo "Player wins the toss"
                player_turn
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

Startboard
toss
display_board


