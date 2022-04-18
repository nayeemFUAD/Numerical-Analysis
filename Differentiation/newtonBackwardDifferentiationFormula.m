clear all
clc
syms p
A = [1, 1.05, 1.10, 1.15, 1.20, 1.25, 1.30];
B = [1, 1.0247, 1.0488, 1.0724, 1.0955, 1.1180, 1.1402];
l = length(B);
newMat = B';
for column = 2 : l
    for row = l : -1 : column
        newMat(row, column) = newMat(row, column - 1) - newMat(row - 1, column -1);
    end
end
disp('Backward Difference Table')
disp([A', newMat])
y = B(l);
h = A(l) - A(l - 1);
x = input("Enter a Point: ");
u = (x - A(l)) / h;
term = 1;
for i = 2 : l
   term = term * (p - 2 + i);  
   y = y + (term / factorial(i - 1)) * newMat(l, i);
end
f(p) = y;
o = input("Enter Order: ");
diff_f(p) = (1 / h.^o) * diff(f(p), p, o);
fprintf("No. of %d Differentiation Using Newton Backward Interpolation at (X = %.4f): %.4f\n", o, x, diff_f(u));
function fact = factorial(n)
fact = 1;
while(n > 1)
    fact = fact * n;
    n = n - 1;
end
end
