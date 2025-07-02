#!/bin/bash
selection=""
menuOptionOne() {
	printf "Filter Crash Data by Years\n\n"
	echo "Enter Start Year (between 1908 and 2009)"
	read start_year
	echo "Enter End Year (between 1908 and 2009)"
	read end_year
	if [[ ! "$start_year" =~ ^[0-9]+$ ]] || [[ ! "$end_year" =~ ^[0-9]+$ ]]; then
		printf "\nError: Both start year and end year must be valid numbers. Try again.\n\n"
		menuOptionOne
	elif [ "$start_year" -gt "$end_year" ]; then
		printf "\nError: Start year cannot be greater than end year. Try again.\n\n"
		menuOptionOne
	elif [ "$end_year" -lt 1908 ]; then
		printf "\nError: End year must be greater than or equal to 1908. Try again. \n\n"
		menuOptionOne
	else
		cd scripts
		./filterdata.sh $start_year $end_year
		printf "Creating Flight Crash Database ...\n\n"
		./makedatabase.sh
		printf "\nDatabase Successfully Made\n\n"
		cd ..
	fi
}

menuOptionTwo() {
	printf "Number of Plane Crashes Per Year\n\n"
	cd scripts
	./runsql.sh countyearlycrashes.sql
	cd ..
}

menuOptionThree() {
	printf "Number of Passengers, Fatalities and Survivors Per Year\n\n"
	cd scripts
	./runsql.sh countyearlypassengers.sql
	cd ..
}

menuOptionFour() {
	printf "Crash Information by Location\n\n"
	cd scripts
	./runsql.sh location.sql
	cd ..
}

menuOptionFive() {
	printf "Crashes Per Operator\n\n"
	cd scripts
	./runsql.sh operator.sql
	cd ..
}

menuOptionSix() {
	printf "Crashes Per Aircraft\n\n"
	cd scripts
	./runsql.sh aircraft.sql
	cd ..
}

menuOptionSeven(){
	printf "Crashes Per Category\n\n"
	cd scripts
	./runsql.sh categories.sql
	cd ..
}

menuOptionEight() {
	printf "Most Common Times of Day for Crashes\n\n"
	cd scripts
	./runsql.sh grouptimes.sql
	cd ..
}

menuOptionNine() {
	printf "Most Common Months for Crashes\n\n"
	cd scripts
	./runsql.sh months.sql
	cd ..
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
	echo "	1 - Choose Years to Filter Data & Create Database"
	echo "	2 - Number of Crashes Per Year"
	echo "	3 - Passenger Information Per Year"
	echo "	4 - Top 10 Crash Locations"
	echo "	5 - Top Number of Crashes Per Operator"
	echo "	6 - Top Number of Crashes Per Aircraft"
	echo "	7 - Crashes By Category"
	echo "	8 - Crashes by Time of Day"
	echo "	9 - Crashes by Month"
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
		 7) clear; menuOptionSeven; pressEnter;;
		 8) clear; menuOptionEight; pressEnter;;
		 9) clear; menuOptionNine; pressEnter;;
	    0) clear; exit;;
	    *) clear; incorrectSelection; pressEnter;;
	esac
done
