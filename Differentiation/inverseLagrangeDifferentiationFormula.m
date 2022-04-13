%Solve by Lagrange Inverse Differentiation Formula
clear all
clc
syms y
A = [2, 4, 9, 10];
B = [4, 56, 711, 980];
l = length(B);
u = input("Enter a Number: ");
o = input("Enter Order of The Differential Equation: ");
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
diff_f(y) = diff(x, y, o);
fprintf("%d No. Derivative at y(%.2f): %.4f\n", o, u, diff_f(u))