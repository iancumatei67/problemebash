#!/bin/bash

# Write caesar cipher script accepting three parameters -s <shift> -i <input file> -o <output file>

while getopts ":s:i:o:" opt; do
	case $opt in 
		s)shift_value=$OPTARG;;
		i)input_file=$OPTARG;;
		o)output_file=$OPTARG;;
		/?)echo "Invadlind option -$OPTARG"; exit 1 ;;

	esac
done


#if [[ -z "$shift_value" ]] || [[ -z "$input_file" ]] || [[ -z "$output_file" ]]; then
#	echo " Wrong format"
#	exit 1
#fi

caesar_cipher() {
  tr '[X-ZA-W]' '[A-Z]'
}

caesar_cipher < "$input_file" > "$output_file"
echo "Encryption successful. Check $output_file"


