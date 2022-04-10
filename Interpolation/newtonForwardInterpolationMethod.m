%Solved By Newton Forward Interpolation Method
clear all
clc
A = [1891, 1901, 1911, 1921, 1931];
B = [9875, 132285, 168076, 195690, 246050];
l = length(B) + 1;
x = input("Enter a Year: ");
h = A(2) - A(1);
p = (x - A(1)) / h;
y = B(1);
newMat = differenceTable(A, B);
for column = 3 : l
    row = column - 1;
    y = y + (pCalculator(p, column - 2) / factorial(column - 2)) * newMat(row, column);
end
disp(newMat)
fprintf("Output: %.4f\n", y);
plot(A, B);
hold on
plot(x, y, '*')
xlabel('x-axis')
ylabel('y-axis')
title('Newton Forward Interpolation Formula')
title(legend, 'My Legends')
legend('Graph', 'Point')
text(x + 1, y, 'New Point')
grid on
hold off
%P Calculator For Forward Interpolation
function calculatedP = pCalculator(p, t)
calculatedP = p;
term = t;
while term > 1
    calculatedP = calculatedP * (p - (term - 1));
    term = term - 1;
end
end