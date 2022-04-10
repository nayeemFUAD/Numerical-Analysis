%Simpson's 3/8 Rule for Numerical Integration
%TITAS P-266 EX-6
clear all
clc
disp("Numerical Integration Using Simpson's 3/8 Rule")
f = @(x) (sin(x));
%Set Definite Range
a = input("Enter Lower Range: ");
b = input("Enter Upper Range: ");
n = input("Enter Total Number of Parts: ");
h = (b - a) / n;
y = f(a) + f(b);
sumDB3 = 0;
sumOthers = 0;
for i = 1 : n - 1
% table for getting functional value
   newMat(i, 1) = a + i * h;
   newMat(i, 2) = f(newMat(i, 1));
   if(mod(i, 3) == 0)
       sumDB3 = sumDB3 + newMat(i, 2);
   else
       sumOthers = sumOthers + newMat(i, 2);
   end
end
y = (3 * h / 8) * (y + (3 * sumOthers + 2 * sumDB3));
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
title("Integration Using Simpson's 3/8 Rule")
xlabel('X-Axis'); ylabel('Y-Axis');
axis([a - .3 b + .3 a - 1 2])
hold off