clear all
clc
f = @(x, y) ((x.^2 + y.^2) / 10);
x(1) = 0;
y(1) = 1;
u = input("Enter a Point to Find It's Solution: ");
h = input("Enter Increament: ");
x = x(1) : h : u;
for i = 2 : length(x)
   k1 = h * f(x(i - 1), y(i - 1));
   k2 = h * f(x(i - 1) + (h / 2), y(i - 1) + (k1 / 2));
   k3 = h * f(x(i - 1) + (h / 2), y(i - 1) + (k2 / 2));
   k4 = h * f(x(i - 1) + h, y(i - 1) + k3);
   y(i) = y(i - 1) + (1 / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
end
fprintf("Solution Of ODE Using RK4 Method at X(%.2f): %.4f\n", u, y(length(y)));
plot(x, y)
hold on
title("Solution Of ODE Using RK4 Method")
title(legend, 'Description')
legend('RK4')
grid on
xlabel('X-Axis'); ylabel('Y-Axis')
hold off
