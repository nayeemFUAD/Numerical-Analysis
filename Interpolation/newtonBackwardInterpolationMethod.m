%Solved By Newton Backward Interpolation Method
clear all
clc
A = [1891, 1901, 1911, 1921, 1931];
B = [46, 66, 81, 93, 101];
l = length(B) + 1;
x = input("Enter a Year: ");
h = A(2) - A(1);
newMat = differenceTable(A, B);
p = (x - A(length(A))) / h;
y = B(length(B));
row = 2 * length(B) - 1;
for column = 3 : l
    row = row - 1;
    y = y + (pCalculator(p, column - 2) / factorial(column - 2)) * newMat(row, column);
end
disp(newMat)
fprintf("Output: %.4f\n", y);
plot(A, B);
hold on
plot(x, y, '*')
xlabel('x-axis')
ylabel('y-axis')
title('Newton Backward Interpolation Formula')
title(legend, 'My Legends')
legend('Graph', 'Point')
text(x + 1, y, 'Intersecting Point')
grid on
hold off
%P Calculator For Backward Interpolation
function calculatedP = pCalculator(p, t)
calculatedP = p;
term = t;
while term > 1
    calculatedP = calculatedP * (p + (term - 1));
    term = term - 1;
end
end