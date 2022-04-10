%Solved By Romberg Integration Formula
clear all
clc
f = @(x) (x.^2);
a = input("Enter Lower Limit: ");          %Lower Limit
b = input("Enter Upper Limit: ");          %Upper Limit
h = (b - a) / 2;        
i = 1;
while(h >= .5)
   I(i) = (h / 2) * (f(a) + 2 * calculator(f, a, b, h) + f(b));
   H(i) = h;
   i = i + 1;
   h = h / 2; 
end
rows = 2 * length(H) - 1;
columns = length(H) + 1;
newMat = zeros(rows, columns);
index = 1;
for i = 1 : 2 : rows
    newMat(i, 1) = H(index);
    newMat(i, 2) = I(index);
    index = index + 1;
end
for j = 3 : 1 : columns
    for i = j - 1 : 2 : rows
        newMat(i, j) = newMat(i + 1, j - 1) + (newMat(i + 1, j - 1) - newMat(i - 1, j - 1)) / 3;
    end
    rows = rows - 1;
end
disp(newMat)
fprintf("Integration Value of the given function: %.4f\n", newMat(rows, columns));
X = a : .1 : b;
n = ((b - a)) / .1 + 1;
for i = 1 : n
   Y(i) = f(X(i)); 
end
area(X, Y)
hold on
title(legend, 'Pointers')
legend('Area Of The Given f(x)')
grid on
title("Integration Using Romberg Integration")
xlabel('X-Axis'); ylabel('Y-Axis');
hold off
function val = calculator(f, a, b, h)
val = 0;
for i = a : (b / h) - 1
    val = val + f(a + i * h);
end
end