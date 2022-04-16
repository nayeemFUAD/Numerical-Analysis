%Solved By Newton Forward Interpolation Method
clear all
clc
A = [1891, 1901, 1911, 1921, 1931];
B = [46, 66, 81, 93, 101];
l = length(B);
y = B(1);
newMAT = B';
h = A(2) - A(1);
x = input("Enter a Point: ");
u = (x - A(1)) / h;
for column = 2 : l
    for row = column : l
        newMAT(row, column) = newMAT(row, column - 1) - newMAT(row - 1, column - 1);
    end
end
disp([A', newMAT])
term = 1;
for i = 2 : l
   term = term * (u + 2 - i);  
   y = y + (term / factorial(i - 1)) * newMAT(i, i);
end
fprintf("Newton Forward Interpolation Value at (X = %d): %.4f\n", x, y);
plot(A, B, 'red');
hold on
plot(x, y, 'black*')
text(x + 1, y, 'New Point')
title('Newton Forward Interpolation Method')
title(legend, 'Description')
legend('Given Data', 'New Point')
xlabel('X-Axis'); ylabel('Y-Axis')
grid on
hold off
function fact = factorial(n)
fact = 1;
while(n > 1)
    fact = fact * n;
    n = n - 1;
end
end
