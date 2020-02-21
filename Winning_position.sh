#!/bin/bash 


declare -A board
player="X"
other="O"
win_move=0
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

check_position()
{
        for ((i=0;i<3;i++))
        do
                for ((j=0;j<3;j++))
                do
                        H=${board[$i,$j]}${board[$i,$(($j+1))]}${board[$i,$(($j+2))]}
                        if [[ $H == "$player$player$player" ]]
                        then
                                echo "You Won !!"
                        elif [[ $H == "$other$other$other" ]]
                        then
                                echo "Computer Won!!"
                                exit
                        fi
                        V=${board[$j,$i]}${board[$(($j+1)),$i]}${board[$(($j+2)),$i]}
                        if [[ $V == "$player$player$player" ]]
                        then
                                echo "You Won!!"
                        elif [[ $V == "$other$other$other" ]]
                        then
                                echo "Computer Won!!"
                                exit
                        fi
                        firstDia=${board[$i,$j]}${board[$((i+1)),$((j+1))]}${board[$((i+2)),$((j+2))]}
                        secondDia=${Arr[$i,$j+2]}${Arr[$((i+1)),$((j+1))]}${Arr[$((i+2)),$((j))]}  
                        if [[ $firstDia == "$player$player$player" ]] || [[ $secondDia == "$player$player$player" ]]
                        then
                                echo "You Won!!"
                                exit
                        elif [[ $firstDia == "$other$other$other" ]] || [[ $secondDiagonal == "$other$other$other" ]]
                        then
                                echo "Computer Won!!"
                                exit
                        fi

                done
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




