#! bash


################## js #########################
# const args = process.argv;
# const nums = args.slice(2);
# const sum = nums.reduce((sum, num)=>sum+parseFloat(num), 0);
# 
# console.log('the sum is: ', sum);

################## bash - first method #########################
# sum=0
# count=$#
# for (( i=1; i<=count; i++ )); do
#   num=$(echo $@ | awk "{print \$$i}")
#   (( sum += num ));
# done
# echo $sum


################## bash - second method #########################
sum=0
for num in "$@"; do
  (( sum += num ))
done
echo $sum
