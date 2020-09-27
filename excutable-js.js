#!/usr/bin/env node

const args = process.argv;
const nums = args.slice(2);
const sum = nums.reduce((sum, num)=>sum+parseFloat(num), 0);

console.log('the sum is: ', sum);
