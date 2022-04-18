%Solved By Newton Forward Difference Formula
%Titas P-203 EX-1
clear all
clc
syms p
A = [3, 3.2, 3.4, 3.6, 3.8, 4.0];
B = [-14.0, -10.032, -5.296, .256, 6.672, 14.0];
l = length(B);
m = l - 1;
newMat = B';
for column = 2 : l
    for row = 1 : m
        newMat(row, column) = newMat(row + 1, column - 1) - newMat(row, column - 1);
    end
    m = m - 1;
end
disp('Forward Difference Table')
disp([A', newMat])
y = B(1);
h = A(2) - A(1);
x = input("Enter a Point: ");
u = (x - A(1)) / h;
term = 1;
for i = 2 : l
   term = term * (p + 2 - i);  
   y = y + (term / factorial(i - 1)) * newMat(1, i);
end
f(p) = y;
o = input("Enter Order: ");
diff_f(p) = (1 / h.^2) * diff(f(p), p, o);
fprintf("No. of %d Derivative Using Newton Forward Interpolation at (X = %.4f): %.4f\n", o, x, diff_f(u));
function fact = factorial(n)
fact = 1;
while(n > 1)
    fact = fact * n;
    n = n - 1;
end
end
