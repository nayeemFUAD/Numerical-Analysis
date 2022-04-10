%Trapezoidal Rule for Numerical Integration
%TITAS P-259 EX-1
clear all
clc
disp("Numerical Integration Using Trapezoidal Rule")
f = @(x) (1 / (1 + x.^2));
%Set Definite Range
a = input("Enter Lower Range: ");
b = input("Enter Upper Range: ");
n = input("Enter Total Number of Sub Divisions: ");
h = (b - a) / n;
y = .5 * (f(a) + f(b));
sum = 0;
for i = 1 : n - 1
% table for getting functional value
   newMat(i, 1) = a + i * h;
   newMat(i, 2) = f(newMat(i, 1));
   sum = sum + newMat(i, 2);
end
y = h * (y + sum);
fprintf("Integration Value of the given function: %.4f\n", y);
X = a : h : b;
for i = 1 : n + 1
   Y(i) = f(X(i)); 
end
area(X, Y)
hold on
bar(X, Y, .01, 'black')
title(legend, 'Pointers')
legend('Area Bounded By Each Trapezium')
grid on
axis on
title("Integration Using Trapezoidal Rule")
xlabel('X-Axis'); ylabel('Y-Axis');
axis([a - .3 b + .3 a - 1 b + 1])
hold off