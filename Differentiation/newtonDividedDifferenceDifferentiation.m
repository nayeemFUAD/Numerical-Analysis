clear all
clc
syms p
A = [0, 1, 4, 5];
B = [4, 3, 24, 39];
l = length(B);
newMat = B';
m = l - 1;
for column = 2 : l
    for row = 1 : m
        num = newMat(row + 1, column - 1) - newMat(row, column - 1);
        denom = A(row + column - 1) - A(row);
        newMat(row, column) = num / denom;
        if(abs(num / denom) < .0001)
            newMat(row, column) = 0;
        end
    end
    m = m - 1;
end
disp("Devided Difference Table")
disp([A', newMat])
x = input("Enter a Point: ");
y = B(1);
for column = 2 : l
    y = y + coefficientCalculator(p, A, column - 1) * newMat(1, column);
end
f(p) = y;
o = input("Enter Order: ");
diff_f(p) = diff(f(p), p, o);
fprintf("No. of %d Differentiation Using Newton Devided Difference Interpolation at (X = %.4f): %.4f\n", o, x, diff_f(x));
function co = coefficientCalculator(x, A, n)
index = 1;
co = x - A(index);
while(n > 1)
    index = index + 1;
    co = co * (x - A(index));
    n = n - 1;
end
end
