% Solve by Newton's Divided Difference Differentiation Formula
clear all
clc
syms p
global A
A = [0, 1, 4, 5];
B = [4, 3, 24, 39];
l = length(B) + 1;
x = input("Enter A Number: ");
y = B(1);
newMat = dividedDifferenceTable(A, B);
disp(newMat)
for i = 3 : 1 : l
   y = y + coefficientCalculator(i) * newMat(i - 1, i);
end
diff_f(p) = diff(y, p);
fprintf("First Derivative at x(%.2f): %.4f\n", x, diff_f(x))
diff2_f(p) = diff(y, p, 2);
fprintf("First Derivative at x(%.2f): %.4f\n", x, diff2_f(x))

function coefficient = coefficientCalculator(n)
syms p
global A
term = n - 2;
coefficient = p - A(1);
while term > 1
    coefficient = coefficient * (p - A(term));
    term = term - 1;
end
end