%Solved By Romberg Integration Formula
clear all
clc
disp("integration Solved By Romberg Integration")
f = @(x) (x.^2);
a = input("Enter Lower Limit: ");
b = input("Enter Upper Limit: ");
h = (b - a) / 2;
index = 1;
while(h >= .5)
    newMat(index, 1) = h;
    newMat(index, 2) = trapezoidalRule(h, a, b, f); 
    index = index + 1;
    h = h / 2;
end
[r, c] = size(newMat);
m = r - 1;
for column = 3 : r + 1
   for row = 1 : m
       newMat(row, column) = newMat(row+1, column-1) + (newMat(row+1, column-1)-newMat(row, column-1))/3;
   end
   m = m - 1;
end
disp(newMat)
fprintf("Integration Value of the given function: %.4f\n", newMat(1, r + 1));
X = a : .01 : b;
for i = 1 : length(X)
   Y(i) = f(X(i)); 
end
area(X, Y)
hold on
title(legend, 'Description')
legend('Area Of The Given f(x)')
grid on
title("Integration Using Romberg Integration")
xlabel('X-Axis'); ylabel('Y-Axis');
hold off
function t = trapezoidalRule(h, a, b, f)
x = a : h : b;
sum = 0;
for i = 1 : length(x)
   y(i) = f(x(i));
   if(i == 1 || i == length(x))
     sum = sum + y(i);
   else
       sum = sum + 2 * y(i);
   end
end
t = (h / 2) * sum;
end
