#!/bin/bash


#Create script, that generates report file with following information:
# current date and time;
#name of current user;
#internal IP address and hostname;
#external IP address;
#name and version of Linux distribution;
#system uptime;
#information about used and free space in / in GB;
#information about total and free RAM;
#number and frequency of CPU cores


report_file(){
	
	DATE=$(date)
	USER=`whoami`
	HOSTN=`hostname`
	IP=$(ifconfig | grep 'inet')
	LINUX=$(uname -srm)
	UPTIME=`uptime`
	SPACE=$(df -h)
	RAM=$(free -h)
	CPU=`lscpu`
	echo -e " Current date and time: \n$DATE "
	echo ""
	echo -e " Name of the current user: \n$USER "
	echo ""
	echo -e " Internal IP address and hostname \n$IP $HOSTN " 
	echo ""
	echo -e " Name and version of Linux distribution: \n$LINUX "
	echo ""
	echo -e " System uptime: \n$UPTIME" 
	echo ""
	echo -e " Info about used and free space: \n$SPACE " 
	echo ""
	echo -e " Info about total and free ram: \n$RAM " 
	echo ""
	echo -e " Number and freq of CPU cores: \n$CPU " 	

}
clear
report_file > report.txt
