%Solve by Lagrange Inverse Differentiation Formula
clear all
clc
syms y
A = [2, 4, 9, 10];
B = [4, 56, 711, 980];
l = length(B);
u = input("Enter a Number: ");
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
diff_f(y) = diff(x, y);
fprintf("First Derivative at y(%.2f): %.4f\n", u, diff_f(u))
diff2_f(y) = diff(x, y, 2);
fprintf("Second Derivative at y(%.2f): %.4f\n", u, diff2_f(u))