Red []

#include %extra.red

first-number: to-integer ask "Enter the first number: "
second-number: to-integer ask "Enter the second number: "
third-number: to-integer ask "Enter the third number: "
largest-number: max-of-series reduce [first-number second-number third-number]
print ["The largest number is:" largest-number]