%Second Order Range-Kutta Method For ODE
clear all
clc
f = @(x, y) (-2 * x - y);
x(1) = 0;
y(1) = -1;
h = .1;
u = input("Enter a Point to Find it's Solution: ");
n = round(u / h);
for i = 2 : n + 1
   x(i) = x(i - 1) + h; 
end

for i = 2 : length(x)
   k1 = h * f(x(i - 1), y(i - 1));
   k2 = h * f(x(i - 1) + (h / 2), y(i - 1) + (k1 / 2));
   y(i) = y(i - 1) + k2;
end
fprintf("The Solution Of The Given ODE at Point(x = %.2f): %.4f\n", u, y(length(y)));
plot(x, y)