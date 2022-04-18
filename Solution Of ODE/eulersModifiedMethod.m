%Euler's Modified Method to Solve ODE
%TITAS P-442 EX-17
clear all
clc
f = @(x, y) (x.^2 + y);
x(1) = 0;
y(1) = 1;
u = input("Enter a Point to Find it's Solution: ");
h = input("Enter Increament: ");
x = x(1) : h : u;
for i = 2 : length(x)
    y(i) = y(i - 1) + h * f(x(i-1), y(i-1));
    temp = y(i);
    while(1)
        y(i) = y(i - 1) + (h / 2) * (f(x(i-1), y(i-1)) + f(x(i), y(i)));
        if(temp == y(i))
            break;
        else
            temp = y(i);
        end
    end
end
fprintf("The Solution Of The Given ODE at Point(x = %.2f): %.4f\n", u, y(length(y)));
plot(x, y)
hold on
title("Solution Of ODE Using Modified Euler's Method")
grid on
xlabel('X-Axis'); ylabel('Y-Axis')
hold off
