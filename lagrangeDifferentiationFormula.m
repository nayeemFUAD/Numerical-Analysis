%Solve by Lagrange Differentiation Formula
clear all
clc
syms x
A = [2, 4, 9, 10];
B = [4, 56, 711, 980];
l = length(B);
u = input("Enter a Number: ");
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
diff_f(x) = diff(y, x);
fprintf("First Derivative at x(%.2f): %.4f\n", u, diff_f(u))
diff2_f(x) = diff(y, x, 2);
fprintf("Second Derivative at x(%.2f): %.4f\n", u, diff2_f(u))