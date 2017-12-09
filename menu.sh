#!/bin/bash

Menu(){
	clear
	echo "------------------------------"
	echo -e "		\033[31;1mUbuntu\033[Sho\033[31;1mW\033[m"
	echo "------------------------------"
	echo "Please, choose one of the following options:"
	echo
	echo -e "\033[36;1m1\033[m - Update repos"
	echo -e "\033[36;1m2\033[m - Upgrade packages"
	echo -e "\033[36;1m3\033[m - Update and Upgrade"
	echo -e "\033[36;1m4\033[m - Install packages"
	echo -e "\033[36;1m5\033[m - Remove packages"
	echo -e "\033[36;1m6\033[m - Exit"
	echo
	echo -ne "Go to \033[31;1m"
	read option
	echo -ne "\033[m"
	
	case $option in
		1)	UpdateRepos
			;;
		2)	#UpgradePackages
			;;
		3)	#UpdateAndUpgrade
			;;
		4)	#Install
			;;
			
		5) #Remove
			;;
		6)	
			exit
			;;
		*)
			echo -e "\033[31;1mInvalid option. Any type to go back.\033[m"
			read -n1 > /dev/null
			Menu
			;;
	esac
}

UpdateRepos(){
	clear
	
	if [ $USER != "root" ]
	then
		echo "--------------------------------------------"
		echo "Looks like you are not the root user."
		echo "Login as root to proceed:"
		echo
		sudo apt-get update -y
	else
		apt-get update -y
	fi
	
	if [[ "$?" != "0" ]];then
		echo -e "\033[31;1mError: you are not root. Any type to go back.\033[m"
		read -n1 > /dev/null
		Menu
	fi
	
	echo -e "\033[31;1mSucess. Any type to go back.\033[m"
	echo
	read -n1 > /dev/null
	Menu
}

# init
Menu
