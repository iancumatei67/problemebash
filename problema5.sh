#!/bin/bash


while getopts ":vsrlui:o:" opt; do
  case $opt in
    v)
      change_case=true
      ;;
    s)
      substitute=true
      ;;
    r)
      reverse_text=true
      ;;
    l)
      to_lower=true
      ;;
    u)
      to_upper=true
      ;;
    i)
      input_file="$OPTARG"
      ;;
    o)
      output_file="$OPTARG"
      ;;
    \?)
      echo "Invalid option -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo " $OPTARG requires argument" >&2
      exit 1
      ;;
  esac
done

#Format verification

if [ -z "$input_file" ] || [ -z "$output_file" ]; then
  echo "Wrong format. Usage form:  $0 -i <input file> -o <output file> [-v] [-s] [-l] [-u] [-r] "
  exit 1
fi

#Operations for each flag

content=$(<"$input_file")

if [ "$change_case" = true ]; then
  content=$(echo "$content" | tr '[:upper:][:lower:]' '[:lower:][:upper:]')
fi

if [ "$substitute" = true ]; then
  content=$(echo "$content" | sed 's/adunare/scadere/g')
fi

if [ "$to_lower" = true ]; then
  content=$(echo "$content" | tr '[:upper:]' '[:lower:]')
fi

if [ "$to_upper" = true ]; then
  content=$(echo "$content" | tr '[:lower:]' '[:upper:]')
fi

if [ "$reverse_text" = true ]; then
  content=$(echo "$content" | tac)
fi

#Content to the output
echo "$content" > "$output_file"

echo "Check $output_file for result"


