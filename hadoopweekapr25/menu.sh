#!/bin/bash
selection=""
menuOptionOne() {
     echo "Create Diamonds Database"
     cd diamonds
     ./makedatabase.sh
     cd ..
}

menuOptionTwo() {
     echo "Show Diamonds Cuts"
     cd diamonds
     ./runsql.sh getcuts.sql
     cd ..
}

menuOptionThree() {
     echo "Get High and Low Prices By Cut"
     cd diamonds
     ./runsql.sh getcuts.sql
     printf '\nEnter Cut : '
     read -r cutis
     ./runsql.sh gethighlow.sql "$cutis"
     cd ..
}

menuOptionFour() {
     echo "Bank Data"
     cd bankdata
     ./bank.sh
     cd ..
}

menuOptionFive() {
     echo "Football Stats"
     cd football
     ./maxmin.sh
}


menuOptionSix() {
     whereami=$pwd
     echo whereami
     echo "test"
     cd test 
     ./testscript.sh
     cd $whereami
}


incorrectSelection() {
     echo "Incorrect Option. Try again"
}

pressEnter() {
     echo ""
     echo "  Press Enter to continue"
     read
     clear
}

until ["$selection" = "0"]; do
	clear
	echo "		Menu"
	echo "	1 - Create Diamonds Database"
	echo "	2 - Get Cut Information"
	echo "	3 - Get High and Low Cut Prices"
	#echo "	4 - Bank Dataset"
	#echo "	5 - Football Stats"
	#echo "	6 - Test"
	echo "	0 - Exit"
	echo ""
	echo -n " Enter Menu Option "
	read selection
	echo ""
	case $selection in
	    1) clear; menuOptionOne; pressEnter;;
	    2) clear; menuOptionTwo; pressEnter;;
	    3) clear; menuOptionThree; pressEnter;;
	    4) clear; menuOptionFour; pressEnter;;
	    5) clear; menuOptionFive; pressEnter;;
	    6) clear; menuOptionSix; pressEnter;;
	    0) clear; exit;;
	    *) clear; incorrectSelection; pressEnter;;
	esac
done
