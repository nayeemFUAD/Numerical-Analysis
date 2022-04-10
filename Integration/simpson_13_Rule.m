%Simpson's 1/3 Rule for Numerical Integration
%TITAS P-261 EX-3
clear all
clc
disp("Numerical Integration Using Simpson's 1/3 Rule")
f = @(x) (sqrt(sin(x) + cos(x)));
%Set Definite Range
a = input("Enter Lower Range: ");
b = input("Enter Upper Range: ");
n = input("Enter Total Sub Divisions: ");
h = (b - a) / n;
y = f(a) + f(b);
sumEven = 0;
sumOdd = 0;
for i = 1 : n - 1
% table for getting functional value
   newMat(i, 1) = a + i * h;
   newMat(i, 2) = f(newMat(i, 1));
   if(mod(i, 2) == 0)
       sumEven = sumEven + newMat(i, 2);
   else
       sumOdd = sumOdd + newMat(i, 2);
   end
end
y = (h / 3) * (y + (4 * sumOdd + 2 * sumEven));
fprintf("Integration Value of the given function: %.4f\n", y);
X = a : h : b;
for i = 1 : n + 1
   Y(i) = f(X(i)); 
end
area(X, Y)
hold on
bar(X, Y, .01, 'black')
title(legend, 'Pointers')
legend('Divided Area')
grid on
axis on
title("Integration Using Simpson's 1/3 Rule")
xlabel('X-Axis'); ylabel('Y-Axis');
axis([a - .3 b + .3 a - 1 2])
hold off