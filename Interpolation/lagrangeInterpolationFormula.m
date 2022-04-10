%Solve by Lagrange Interpolation Method
clear all
clc
A = [300, 304, 305, 307];
B = [2.4771, 2.4829, 2.4843, 2.4871];
l = length(B);
x = input("Enter a Number: ");
y = 0;
for i = 1 : l
    num = 1;
    denum = 1;
    index = i;
    tempX = A(i);
    tempY = B(i);
    for j = 1 : l
        if(i ~= j)
            num = num * (x - A(j));  
            denum = denum * (tempX - A(j));
        end      
    end
    y = y + tempY * (num / denum);
end
fprintf("Output: %.4f\n", y);
plot(A, B);
hold on
plot(x, y, '*')
xlabel('x-axis')
ylabel('y-axis')
title('Lagrange Interpolation Formula')
title(legend, 'Pointers')
legend('Graph', 'Point')
text(x + .2, y, 'New Point')
grid on
hold off