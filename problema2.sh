#!/bin/bash
#Write bash script accepting operation parameter (“-”, “+”, “*”, “%”), sequence of numbers and debug flag. For example:
# ./your_script.sh -o % -n 5 3 -d > Result: 2
#./your_script.sh -o + -n 3 5 7 -d > Result: 15

#If -d flag is passed, script must print additional information:
#User: <username of the user running the script>
#Script: <script name>        
#Operation: <operation>
#Numbers: <all space-separated numbers>

#Function to display debug info

debug_info(){

echo "User: $(whoami) "
echo "Script: $0 "
echo "Operation: $operation "
echo "Numbers: ${numbers[*]} "

}

#Function to perform the operations

do_operation(){

  local result=${numbers[0]}

  for ((i = 1; i < ${#numbers[@]}; i++)); do
    case $operation in
      "+") result=$((result + numbers[i])) ;;
      "-") result=$((result - numbers[i])) ;;
      "*") result=$((result * numbers[i])) ;;
      "%") result=$((result % numbers[i])) ;;
      *) echo "Invalid operation: $operation"; exit 1 ;;
    esac
  done

  echo "$result"
}
#Parse command line arguments using getopts

while getopts ":o:n:d" opt; do
  case "$opt" in

	o) 
	  operation="$OPTARG" 

;;
	n) 
	  numbers="$OPTARG"
;;
	d)
	  debug=true

;;
	\?) 
	   echo "Invalid option: -$OPTARG "
           exit 1

;;
	:)
	   echo " Option -$OPTARG requires an argument"; exit 1
;;

  esac
done

#Check if operation is provided 

if [[ -z "$operation" ]] || [[ ${#numbers[@]} -eq 0 ]]; then
   echo " You must use : $0 -o <operation> -n <numbers> [-d] "
   exit 1
fi
echo "Result=$(do_operation)"


#Display debug info if -d flag is passed

if [[ "$debug" ]]; then 
  debug_info
fi

	



