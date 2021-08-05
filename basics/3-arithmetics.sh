#!/bin/bash

num1=2
num2=3

echo "modulus: $(( num1 %= num2 )) "
echo "add: $(( num1 + num2 )) "
echo "subtract: $(( num1 - num2 )) "
echo "divide: $(( num1 / num2 )) "
echo "power: $(( num1 ** num2 )) "
echo "unary, use num then increase: $(( num1++ )) "
echo "unary, use num then decrease: $(( num1-- )) "
echo "unary, increase num then use: $(( ++num1 )) "
echo "unary, decrease num then use: $(( --num1 )) "

echo
echo "========= you can use expr command to do the same ============"
echo "========= > expr 1 + 2 "
echo "========= > expr 5 /  4 - 3 "

