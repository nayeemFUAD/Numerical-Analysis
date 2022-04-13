clear all
clc
f = @(x, y) (-2 * x - y);
x(1) = 0;
y(1) = -1;
h = input("Enter Increament: ");
u = input("Enter a Point To Find It's Solution: ");
n = round(u / h) + 1;
for i = 2 : n
   x(i) = x(i - 1) + h; 
end
for i = 2 : length(x)
   k1 = h * f(x(i - 1), y(i - 1));
   k2 = h * f(x(i - 1) + (h / 2), y(i - 1) + (k1 / 2));
   y(i) = y(i - 1) + k2;
end
fprintf("The Solution Of The Given ODE using RK2 at Point(x = %.2f): %.4f\n", u, y(length(y)));
plot(x, y, 'red')
hold on
for i = 2 : length(x)
   k1 = h * f(x(i - 1), y(i - 1));
   k2 = h * f(x(i - 1) + (h / 2), y(i - 1) + (k1 / 2));
   k3 = h * f(x(i - 1) + h, y(i - 1) + 2 * k2 - k1);
   y(i) = y(i - 1) + (k1 + 4 * k2 + k3) / 6;
end
fprintf("The Solution Of The Given ODE using RK3 at Point(x = %.2f): %.4f\n", u, y(length(y)));
plot(x, y, 'blue')
for i = 2 : length(x)
   k1 = h * f(x(i - 1), y(i - 1));
   k2 = h * f(x(i - 1) + (h / 2), y(i - 1) + (k1 / 2));
   k3 = h * f(x(i - 1) + (h / 2), y(i - 1) + (k2 / 2));
   k4 = h * f(x(i - 1) + h, y(i - 1) + k3);
   y(i) = y(i - 1) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
end
fprintf("The Solution Of The Given ODE using RK4 at Point(x = %.2f): %.4f\n", u, y(length(y)));
plot(x, y, 'green')
title("Solution Of ODE Using Range-Kutta Method")
title(legend, 'Graph')
legend('RK2', 'RK3', 'RK4')
grid on
xlabel('X-Axis'); ylabel('Y-Axis')
hold off