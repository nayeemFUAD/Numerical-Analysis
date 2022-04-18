clear all
clc
disp("Numerical Integration Using Simpson's 3/8 Rule")
f = @(x) (sin(x));
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
    if(mod(i, 3) == 0)
        sum = sum + 2 * Y(i);
    else
        sum = sum + 3 * Y(i);
    end
end
answer = (3 * h / 8) * sum;
fprintf("Integration Value of the given function: %.4f\n", answer);
area(x, y)
hold on
bar(x, y, .01, 'black')
title(legend, 'Description')
legend('Graph of The Given Function', 'Slices')
grid on
axis on
title("Integration Using Simpson's 3/8 Rule")
xlabel('X-Axis'); ylabel('Y-Axis');
axis([a b -answer answer])
hold off
