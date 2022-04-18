clear all
clc
disp("Numerical Integration Using Simpson's 1/3 Rule")
f = @(x) (sqrt(sin(x) + cos(x)));
a = input("Enter Lower Limit: ");
b = input("Enter Upper Limit: ");
n = input("Enter Number Of Sub-Divisions: ");
h = (b - a) / n;
x = a : h : b;
sum = 0;
for i = 1 : length(x)
   y(i) = f(x(i));
   if(i == 1 || i == length(x))
       sum = sum + y(i);
   end
end
Y = y(2 : length(y) - 1);
for i = 1 : length(Y)
    if(mod(i, 2) == 0)
        sum = sum + 2 * Y(i);
    else
        sum = sum + 4 * Y(i);
    end
end
answer = (h / 3) * sum;
fprintf("Integration Value of the given function: %.4f\n", answer);
area(x, y)
hold on
bar(x, y, .01, 'black')
axis on
axis([a b -answer answer])
grid on
title("Solved By Simpson's 1/3 Rule")
title(legend, "Description")
legend("Given Function", "Slides")
xlabel("X-Axis"); ylabel("Y-Axis")
hold off
