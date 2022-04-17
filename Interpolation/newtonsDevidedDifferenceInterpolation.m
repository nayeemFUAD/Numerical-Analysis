clear all
clc
A = [300, 304, 305, 307];
B = [2.4771, 2.4829, 2.4843, 2.4871];
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
    y = y + coefficientCalculator(x, A, column - 1) * newMat(1, column);
end
fprintf("Newton Devided Difference Interpolation Value at (X = %d): %.4f\n", x, y);
plot(A, B, 'red');
hold on
plot(x, y, 'black*')
text(x + 1, y, 'New Point')
title('Newton Divided Difference Interpolation Method')
title(legend, 'Description')
legend('Given Data', 'New Point')
xlabel('X-Axis'); ylabel('Y-Axis')
grid on
hold off
function co = coefficientCalculator(x, A, n)
index = 1;
co = x - A(index);
while(n > 1)
    index = index + 1;
    co = co * (x - A(index));
    n = n - 1;
end
end
