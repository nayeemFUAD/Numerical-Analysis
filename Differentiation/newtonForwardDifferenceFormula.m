%Solved By Newton Forward Difference Formula
%Titas P-203 EX-1
clear all
clc
syms p
A = [3, 3.2, 3.4, 3.6, 3.8, 4.0];
B = [-14.0, -10.032, -5.296, .256, 6.672, 14.0];
l = length(B) + 1;
h = A(2) - A(1);
y = B(1);
x = input("Enter a Point: ");
o = input("Enter Order of The Differential Equation: ");
u = (x - A(1)) / h;
newMat = differenceTable(A, B);
for column = 3 : l
    row = column - 1;
    y = y + (pCalculator(column - 2) / factorial(column - 2)) * newMat(row, column);
end
disp(newMat)
diff_f(p) = (1 / h.^o) * diff(y, p, o);
fprintf("%d No. Derivative at x(%.2f): %.4f\n", o, x, diff_f(u))
%P Calculator For Forward Interpolation
function calculatedP = pCalculator(t)
syms p
calculatedP = p;
term = t;
while term > 1
    calculatedP = calculatedP * (p - (term - 1));
    term = term - 1;
end
end