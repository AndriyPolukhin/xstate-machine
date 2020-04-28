#!/bin/bash


# 1. Return values

# If notes.md file doesn't exist, create one and 
# add the text "created by bash"

if find notes.md
then
  echo "notes.md file already exists"
else
  echo "created by bash" | cat >> notes.md
fi


# 2. Arithmetic Evaluations
read -p "Enter your age: " age

if (( "$age" > 18 ))
then
  echo "Adult!"
elif (( "$age" > 12 ))
then
  echo "Teen!"
else
  echo "Kid"
fi


# 3. Test Expessions
# Check if argumet was passed
# "$1" corresponds to first argument
if [[ -n "$1" ]]
then
  echo "Your first agrument was $1"
else
  echo "No Arguments passed"
fi

# Looping

# print number 1 to 10

# c like for loop
for (( i = 1; i <= 10; ++i ))
do
  echo "$i"
done


# for in 
for i in {1..10}
do
  echo "$i"
done

# while
i=1
while [[ "$i" -le 10 ]]
do
  echo "$i"
  ((i++))
done

# until

i=1
until [[ "$i" -eq 11 ]]
do
  echo "until $i"
  ((i++))
done


# Arrays
arr=(a b c d)

# For in
for i in "${arr[@]}"
do
  echo "$i"
done

# c like for
for (( i = 0; i < "${#arr[@]}"; i++))
do
  echo "${arr[$i]}"
done

# while
i=0
while [[ "$i" -le "${#arr[@]}" ]]
do
  echo "${arr[$i]}"
  (( i++ ))
done


# Iterate over an argument
for i in "$@"
do
  echo "$i"
done



# Arrays
arr2=(a b c d)

# Read Arrays
echo "${arr[1]}"     # Single element
echo "${arr[-1]}"    # Last element
echo "${arr[@]:1}"   # Elements from 1
echo "${arr[@]:1:3}" # Elements from 1 to 3

# Insert into Arrays
arr[5]=e                             # direct address  and instert/update
arr=(${arr[@]:0:1} new ${arr[@]:1})  # adding 'new' to array

# Delete from Array
arr3=(a b c d)
unset arr3[1]
arr3=("${arr3[@]}")

echo "${arr3[1]}" 

# Functions
greet() {
  echo "Hello, ${@}"
}

greet Andriy
