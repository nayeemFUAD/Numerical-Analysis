%Euler's Method to Solve ODE
clear all
clc
f = @(x, y) (-2 * x -y);
x(1) = 0;
y(1) = -1;
h = 0.1;
u = input("Enter a Point to Find it's Solution: ");
n = round(u / h);
for i = 2 : n
    x(i) = x(i - 1) + h;
end
for i = 2 : length(x) + 1
    y(i) = y(i - 1) + h * f(x(i - 1), y(i - 1));
end
fprintf("The Solution Of The Given ODE at Point(x = %.2f): %.4f\n", u, y(length(y)));