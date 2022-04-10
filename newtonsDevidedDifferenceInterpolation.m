% Solves by Newton's Divided Difference Interpolation Formula
clear all
clc
global A
A = [300, 304, 305, 307];
B = [2.4771, 2.4829, 2.4843, 2.4871];
l = length(B) + 1;
x = input("Enter A Number: ");
y = B(1);
newMat = dividedDifferenceTable(A, B);
for i = 3 : 1 : l
   y = y + coefficientCalculator(x, i) * newMat(i - 1, i);
end
disp(newMat)
fprintf("Output: %.4f\n", y);
plot(A, B);
hold on
plot(x, y, '*')
xlabel('x-axis')
ylabel('y-axis')
title('Newton Divided Difference Formula')
title(legend, 'My Pointers')
legend('Graph', 'Point')
text(x + .3, y, 'Intersecting Point')
grid on
hold off
function coefficient = coefficientCalculator(x, n)
global A
term = n - 2;
coefficient = x - A(1);
while term > 1
    coefficient = coefficient * (x - A(term));
    term = term - 1;
end
end