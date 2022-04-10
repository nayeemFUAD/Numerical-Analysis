%Factorial Calculator
function fact = factorial(number)
fact = 1;
n = number;
while n > 1
    fact = fact * n;
    n = n - 1;
end
end