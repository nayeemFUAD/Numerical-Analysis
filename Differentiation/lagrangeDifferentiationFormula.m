clear all
clc
syms p
A = [2, 4, 9, 10];
B = [4, 56, 711, 980];
l = length(B);
y = 0;
x = input("Enter a Point: ");
for iteration = 1 : l
   num = 1;
   denum = 1;
   for i = 1 : l
       if(iteration ~= i)
           num = num * (p - A(i));
           denum = denum * (A(iteration) - A(i));
       end
   end
   y = y + (num / denum) * B(iteration);
end
f(p) = y;
o = input("Enter Order: ");
diff_f(p) = diff(f(p), p, o);
fprintf("No. of %d Differentiation Using Lagrange Interpolation at (X = %.4f): %.4f\n", o, x, diff_f(x)); 
