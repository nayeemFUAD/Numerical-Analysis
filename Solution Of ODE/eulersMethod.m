clear all
clc
f = @(x, y) ((y - x) / (y + x));
x(1) = 0;
y(1) = 1;
u = input("Enter a Point To Find It's Solution: ");
h = input("Enter Increament: ");
x = x(1) : h : u;
for i = 2 : length(x)
    y(i) = y(i - 1) + h * f(x(i - 1), y(i - 1));
end
fprintf("The Solution Of The Given ODE at Point (X = %.2f): %.4f\n", u, y(length(y)));
plot(x, y)
hold on
title("Solution Of ODE Using Euler's Method")
grid on
xlabel('X-Axis'); ylabel('Y-Axis')
hold off
