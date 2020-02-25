#!/bin/bash  

declare -A board
echo "Welcome to Tic Tac Toe"
player="X"
other="O"
win_move=0
#**************************************************************************************************************
#                                          Creating Empty board 
#**************************************************************************************************************
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

#***************************************************************************************************************
#                                           Displays board 
#***************************************************************************************************************
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
#***************************************************************************************************************
#                                  Checking whether computer or player is wining
#***************************************************************************************************************
check_position()
{
	for ((i=0;i<3;i++))
	do
		for ((j=0;j<3;j++))
		do
			# Horizontally checking winning possibility 
			H=${board[$i,$j]}${board[$i,$(($j+1))]}${board[$i,$(($j+2))]}
			if [[ $H == "$player$player$player" ]]
			then
  				echo "player wins"
				exit
			elif [[ $H == "$other$other$other" ]]
			then
				echo "Computer Won!!"
				exit
			fi
			# Vertically checking winning possibility 
			V=${board[$j,$i]}${board[$(($j+1)),$i]}${board[$(($j+2)),$i]}
			if [[ $V == "$player$player$player" ]]
                        then
                                echo "You Won!!"
				exit
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
#************************************************************************************************************
#                               Checking for the tie condition
#*************************************************************************************************************
tie_position()
{
	if [[ $win_pos -eq 9 ]]
	then
		echo "Game is tie"
		exit
	fi
}
#*************************************************************************************************************
#                                     Player position logic
#**************************************************************************************************************
player_turn()
{
	if [[ $win_pos -le 8 ]]
	then	
		echo "Enter the value of row and column"
		read row column

		if [[ ${board[$row,$column]} == "-" ]]
		then
			board[$row,$column]=$player
			display_board
			check_position
			tie_position
			win_pos=$(($win_pos + 1))
                	computer_turn
		else
			echo "Position Occupied Or Invalid Position For Computer!!"
			player_turn	
		fi
		
	fi
}
#***************************************************************************************************************\
#                               Checking for win postion for computer
#***************************************************************************************************************
win_postion()
{
space="-"
for ((i=0;i<3;i++))
	do
		for ((j=0;j<3;j++))
		do
			row=$((RANDOM%3))
			column=$((RANDOM%3))
			V1=${board[$j,$i]}${board[$(($j+1)),$i]}${board[$(($j+2)),$i]}
			H1=${board[$i,$j]}${board[$i,$(($j+1))]}${board[$i,$(($j+2))]}
			fD1=${board[$i,$j]}${board[$((i+1)),$((j+1))]}${board[$((i+2)),$((j+2))]}
			sD1=${board[$i,$j+2]}${board[$((i+1)),$((j+1))]}${board[$((i+2)),$((j))]}

			if [[ ${board[$row,$column]} == "-" ]]
        		then
				if [[ $H1 == "$other$space$other" ]]
				then
					echo H1 Position of computer for row and column are: $i,$(($j+1))
  					board[$i,$(($j+1))]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $H1 == "$other$other$space" ]]
				then
				echo H1 Position of computer for row and column are:$i,$(($j+2))
					board[$i,$(($j+2))]=$other
					win_pos=$(($win_pos + 1))
					
					
				elif [[ $H1 == "$space$other$other" ]]
				then
				echo H1 Position of computer for row and column are: $i,$j
					board[$i,$j]=$other
					win_pos=$(($win_pos + 1))
				
					
				elif [[ $V1 == "$other$space$other" ]]
				then
					echo V1 Position of computer for row and column are:$(($j+1)),$i
  						board[$(($j+1)),$i]=$other
				  	win_pos=$(($win_pos + 1))
					
				elif [[ $V1 == "$other$other$space" ]]
				then
					echo V1 Position of computer for row and column are: $(($j+2)),$i
					board[$(($j+2)),$i]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $V1 == "$space$other$other" ]]
				then
					echo V1 Position of computer for row and column are: $j,$i
					board[$j,$i]=$other
					win_pos=$(($win_pos + 1))
					
			
				elif [[ $fD1 == "$other$space$other" ]]
				then
					echo  D1 Position of computer for row and column are: $((i+1)),$((j+1))
  					board[$((i+1)),$((j+1))]=$other
					  win_pos=$(($win_pos + 1))
				
				elif [[ $fD1 == "$other$other$space" ]]
				then
					echo D1Position of computer for row and column are: $((i+2)),$((j+2))
					board[$((i+2)),$((j+2))]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $fD1 == "$space$other$other" ]]
				then
					echo D1Position of computer for row and column are: $i,$j
					board[$i,$j]=$other
					win_pos=$(($win_pos + 1))
					
			  
				elif [[ $sD1 == "$other$space$other" ]]
				then
					echo D1Position of computer for row and column are: $((i+1)),$((j+1))
  					board[$((i+1)),$((j+1))]=$other
					  win_pos=$(($win_pos + 1))
					
				elif [[ $sD1 == "$other$other$space" ]]
				then
					echo D1Position of computer for row and column are: $((i+2)),$((j))
					board[$((i+2)),$((j))]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $sD1 == "$space$other$other" ]]
				then
					echo D1Position of computer for row and column are: $i,$j+2
					board[$i,$j+2]=$other
					win_pos=$(($win_pos + 1))
					
				else
					block_position
					
			
			fi
				display_board
				check_position
				tie_position
				player_turn
			else
				computer_turn
			fi
		done
	done


}

#*****************************************************************************************************************
#                                       checking for block postion for player
#*****************************************************************************************************************
block_position()
{
space="-"
for ((i=0;i<3;i++))
	do
		for ((j=0;j<3;j++))
		do
			row=$((RANDOM%3))
			column=$((RANDOM%3))
			V=${board[$j,$i]}${board[$(($j+1)),$i]}${board[$(($j+2)),$i]}
			H=${board[$i,$j]}${board[$i,$(($j+1))]}${board[$i,$(($j+2))]}
			fD=${board[$i,$j]}${board[$((i+1)),$((j+1))]}${board[$((i+2)),$((j+2))]}
			sD=${board[$i,$j+2]}${board[$((i+1)),$((j+1))]}${board[$((i+2)),$((j))]}
			if [[ ${board[$row,$column]} == "-" ]]
        		then
				
				if [[ $H == "$player$space$player" ]]
				then
					echo Position of computer for row and column are: $i,$(($j+1))
  					board[$i,$(($j+1))]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $H == "$player$player$space" ]]
				then
				echo Position of computer for row and column are:$i,$(($j+2))
					board[$i,$(($j+2))]=$other
					win_pos=$(($win_pos + 1))
					
					
				elif [[ $H == "$space$player$player" ]]
				then
				echo Position of computer for row and column are: $i,$j
					board[$i,$j]=$other
					win_pos=$(($win_pos + 1))
				
					
				elif [[ $V == "$player$space$player" ]]
				then
					echo Position of computer for row and column are:$(($j+1)),$i
  						board[$(($j+1)),$i]=$other
				  	win_pos=$(($win_pos + 1))
					
				elif [[ $V == "$player$player$space" ]]
				then
					echo Position of computer for row and column are: $(($j+2)),$i
					board[$(($j+2)),$i]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $V == "$space$player$player" ]]
				then
					echo Position of computer for row and column are: $j,$i
					board[$j,$i]=$other
					win_pos=$(($win_pos + 1))
					
			
				elif [[ $fD == "$player$space$player" ]]
				then
					echo Position of computer for row and column are: $((i+1)),$((j+1))
  					board[$((i+1)),$((j+1))]=$other
					  win_pos=$(($win_pos + 1))
				
				elif [[ $fD == "$player$player$space" ]]
				then
					echo Position of computer for row and column are: $((i+2)),$((j+2))
					board[$((i+2)),$((j+2))]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $fD == "$space$player$player" ]]
				then
					echo Position of computer for row and column are: $i,$j
					board[$i,$j]=$other
					win_pos=$(($win_pos + 1))
					
			  
				elif [[ $sD == "$player$space$player" ]]
				then
					echo Position of computer for row and column are: $((i+1)),$((j+1))
  					board[$((i+1)),$((j+1))]=$other
					  win_pos=$(($win_pos + 1))
					
				elif [[ $sD == "$player$player$space" ]]
				then
					echo Position of computer for row and column are: $((i+2)),$((j))
					board[$((i+2)),$((j))]=$other
					win_pos=$(($win_pos + 1))
					
				elif [[ $sD == "$space$player$player" ]]
				then
					echo Position of computer for row and column are: $i,$j+2
					board[$i,$j+2]=$other
					win_pos=$(($win_pos + 1))
					
			else
					echo The Position of computer for row and column are: $row $column
					
					board[$row,$column]=$other
					win_pos=$(($win_pos + 1))
					
					
			
			fi
			display_board
			check_position
			tie_position
			player_turn
			else
				computer_turn
			fi
		done
	done

	

}
#*****************************************************************************************************************
#                                      computer postion logic
#*****************************************************************************************************************
computer_turn()
{
	if [[ $win_pos -le 8 ]]
	then
			win_postion
		
	fi
}
#*****************************************************************************************************************
#                                               Who will play first 
#*****************************************************************************************************************
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
#********************************************************************************************************************
#                                                 Asking user to select letter to stsrt the game
#********************************************************************************************************************
ask()
{
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
		ask
                ;;
        esac 
}
#*******************************************************************************************************************
#calling function to start the game
#*******************************************************************************************************************
ask       
Startboard
toss
