% Solved By Newton Backward Difference Formula
%Titas P-237 EX-23
clear all
clc
syms p
A = [1, 1.05, 1.10, 1.15, 1.20, 1.25, 1.30];
B = [1, 1.0247, 1.0488, 1.0724, 1.0955, 1.1180, 1.1402];
l = length(B) + 1;
h = A(2) - A(1);
y = B(length(B));
x = input("Enter a Point: ");
u = (x - A(length(A))) / h;
newMat = differenceTable(A, B);
row = 2 * length(B) - 1;
for column = 3 : l
    row = row - 1;
    y = y + (pCalculator(column - 2) / factorial(column - 2)) * newMat(row, column);
end
disp(newMat)
diff_f(p) = (1 / h) * diff(y, p);
fprintf("First Derivative at x(%.2f): %.4f\n", x, diff_f(u))
diff2_f(p) = (1 / h.^2) * diff(y, p, 2);
fprintf("Second Derivative at x(%.2f): %.4f\n", x, diff2_f(u))

%P Calculator For Backward Interpolation
function calculatedP = pCalculator(t)
syms p
calculatedP = p;
term = t;
while term > 1
    calculatedP = calculatedP * (p + (term - 1));
    term = term - 1;
end
end