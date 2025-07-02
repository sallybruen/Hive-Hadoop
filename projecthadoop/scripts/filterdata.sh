#!/bin/bash
start_year=$1
end_year=$2

input_file="crashes.csv"
output_file="filteredcrashes.csv"
rm -f "%output_file"

awk -F',' -v start="$start_year" -v end="$end_year" '
BEGIN { OFS="," }
NR == 1 {
  print $1, $2, $3, $4, $6, $7, $10, $11, $13
  next
}
{
  split($1, date_parts, "/")
  year = date_parts[3]

  if (year >= start && year <= end) {
    print $1, $2, $3, $4, $6, $7, $10, $11, $13
  }
}' "$input_file" >"$output_file"
printf "\nData Filtered Successfully. Data outputted to $output_file file.\n\n"
