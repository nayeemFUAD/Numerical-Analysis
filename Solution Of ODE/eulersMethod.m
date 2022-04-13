%Euler's Method to Solve ODE
clear all
clc
f = @(x, y) ((y-x) / (y+x));
x(1) = 0;
y(1) = 1;
h = 0.02;
u = input("Enter a Point to Find it's Solution: ");
n = round(u / h) + 1;
for i = 2 : n
    x(i) = x(i - 1) + h;
end
for i = 2 : length(x)
    y(i) = y(i - 1) + h * f(x(i - 1), y(i - 1));
end
fprintf("The Solution Of The Given ODE at Point(x = %.2f): %.4f\n", u, y(length(y)));
plot(x, y)
hold on
title("Solution Of ODE Using Euler's Method")
grid on
xlabel('X-Axis'); ylabel('Y-Axis')
hold off