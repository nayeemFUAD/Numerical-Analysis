%Trapezoidal Rule for Numerical Integration
%TITAS P-259 EX-1
clear all
clc
disp("Numerical Integration Using Trapezoidal Rule")
f = @(x) (1 / (1 + x.^2));
a = input("Enter Lower Range: ");
b = input("Enter Upper Range: ");
n = input("Enter total number of Sub-Divisions: ");
h = (b - a) / n;
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
answer = (h / 2) * sum;
fprintf("Integration Value of the given function: %.4f\n", answer);
area(x, y)
hold on
bar(x, y, .01, 'black')
title(legend, 'Description')
legend('Area Bounded By Each Trapezium', 'Slides')
grid on
axis on
title("Integration Using Trapezoidal Rule")
xlabel('X-Axis'); ylabel('Y-Axis');
axis([a b -answer answer])
hold off
