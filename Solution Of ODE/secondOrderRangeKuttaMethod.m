clear all
clc
f = @(x, y) ((x.^2 + y.^2) / 10);
x(1) = 0;
y(1) = 1;
u = input("Enter a Point to Find it's solution: ");
h = input("Enter Increament: ");
x = x(1) : h : u;
for i = 2 : length(x)
   k1 = h * f(x(i - 1), y(i - 1));
   k2 = h * f(x(i - 1) + h, y(i - 1) + k1);
   y(i) = y(i - 1) + ((k1 + k2) / 2);
end
fprintf("Solution Of ODE Using RK2 Method at X(%.2f): %.4f\n", u, y(length(y)));
plot(x, y)
hold on
title("Solution Of ODE Using RK2 Method")
title(legend, 'Description')
legend('RK2')
grid on
xlabel('X-Axis'); ylabel('Y-Axis')
hold off
