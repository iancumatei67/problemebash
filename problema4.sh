#!/bin/bash

#Functia pentru caesar cipher

caesar_cipher() {
    local text="$1"
    local shift="$2"
    local result=""

    for ((i = 0; i < ${#text}; i++)); do
        char="${text:$i:1}"
        if [[ "$char" =~ [A-Za-z] ]]; then
            ascii_val=$(printf '%d' "'$char")
            if [[ "$char" =~ [[:upper:]] ]]; then
                ascii_val=$(((ascii_val - 65 + shift) % 26 + 65))
            else
                ascii_val=$(((ascii_val - 97 + shift) % 26 + 97))
            fi
            result+="$(printf \\$(printf '%03o' "$ascii_val"))"
        else
            result+="$char"
        fi
    done

    echo "$result"
}

# Valorea default 
shift_val=0

# Getopts pentru flaguri
while getopts ":s:i:o:" opt; do
    case $opt in
    s)
        shift_val=$OPTARG
        ;;
    i)
        input_file=$OPTARG
        ;;
    o)
        output_file=$OPTARG
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument." >&2
        exit 1
        ;;
    esac
done

#Verificare a folosirii corecte de flaguri

if [[ -z $input_file || -z $output_file ]]; then
    echo "Usage: $0 -s <shift> -i <input file> -o <output file>"
    exit 1
fi

# Verificare existanta continut input file

if [ ! -f "$input_file" ]; then
    echo "Input file $input_file not found."
    exit 1
fi

# Citire input file si criptare

encrypted_text=$(caesar_cipher "$(cat "$input_file")" "$shift_val")

# Scrierea textului criptat in output

echo "$encrypted_text" >"$output_file"

echo "Success. Check  $output_file."
                                                                                                                                                                         13,21         Top
