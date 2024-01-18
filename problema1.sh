#!/bin/bash 

#The Fibonacci numbers are the numbers in the following integer sequence. 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, …….. In mathematical terms, the sequence Fn of Fibonacci numbers is defined by the recurrence relation Fn = Fn-1 + Fn-2 with seed values F0 = 0 and F1 = 1. Write a function fib that returns Fn. For example:
#if n = 0, then fib should return 0
#if n = 1, then it should return 1
#if n > 1, it should return Fn-1 + Fn-2


funcfib() {
n=$1
a=0
b=1


for (( i=0 ; i<n; i++ ));
do
	echo -n " $a "
	fn=$((a + b))
	a=$b
	b=$fn
done

}

clear

read -p " Choose the total  number for the Fibonacci series " N

funcfib $N





