%Solve by Inverse Lagrange Interpolation Method
clear all
clc
A = [2, 5, 8, 14];
B = [94.8, 87.9, 81.3, 68.7];
l = length(B);
y = input("Enter a Number: ");
x = 0;
for i = 1 : l
    num = 1;
    denum = 1;
    index = i;
    tempX = A(i);
    tempY = B(i);
    for j = 1 : l
        if(i ~= j)
            num = num * (y - B(j));  
            denum = denum * (tempY - B(j));
        end      
    end
    x = x + tempX * (num / denum);
end
fprintf("Output: %.4f\n", x);
plot(A, B);
hold on
plot(x, y, '*')
xlabel('x-axis')
ylabel('y-axis')
title('Inverse Lagrange Interpolation Formula')
title(legend, 'Pointers')
legend('Graph', 'Point')
text(x + .2, y, 'New Point')
grid on
hold off