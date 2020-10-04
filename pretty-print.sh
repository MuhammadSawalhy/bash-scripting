#!/bin/bash

declare -a text_array
declare -i max_len=0

# read texts from users
while (true); do
   read -p "input text: " text
   if [ "$text" = "quit" ] || [ "$text" = "q" ]; then
     break 
   fi
   text_array+=("$text")
done

echo "we got your inputs!"
echo

# get the max length of all inputs 
for t in "${text_array[@]}"; do
   t_len=${#t}

   max_len=$(test $t_len -gt $max_len && echo $t_len || echo $max_len)
done

# make sure that max_len is even as we will deal with it's half
max_len=$(test $((max_len%2)) -eq 0 && echo $max_len || expr $max_len + 1)
# increase the length for space before and space after the original text
((max_len+=2))

print_str(){
   if [ ! $# -eq 2 ]; then
      echo "You have to pass one argument and the text-align as 2nd argument!"
      return 1
   else
      str=$1
      # get the length of it
      str_len=${#str}


      # get spaces to put texts in a spesific length and align it
      if [ $2 = "center" ]; then
         # to make the echoed str in the center
         len=$(((max_len - str_len)/2))
         # round the value
         # len=${len%.*} ## or$ printf -v int "%.0f" "$len" ## or$ prinf "%0.f" "$len"
         spaces_before=$(printf "%${len}s" " ")
         spaces_after=$(printf "%$(( max_len - len - str_len ))s" " ")
      elif [ $2 = "left" ]; then
         # to make the aligned to the left
         spaces_before=" "
         spaces_after=$(printf "%$(( max_len - str_len - 1 ))s" " ")
      elif [ $2 = "right" ]; then
         # to make the aligned to the right
         spaces_after=" "
         spaces_before=$(printf "%$(( max_len - str_len - 1 ))s" " ")
      fi

      dashes="------------"

      # output
      echo "$dashes$spaces_before$str$spaces_after$dashes"
   fi
}

align=$([ ! -z $1 ] && echo $1 || echo "center")

for t in "${text_array[@]}"; do
   print_str "$t" $align
done
