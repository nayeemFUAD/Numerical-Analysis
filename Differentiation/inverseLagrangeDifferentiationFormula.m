clear all
clc
syms p
A = [2, 4, 9, 10];
B = [4, 56, 711, 980];
l = length(B);
x = 0;
y = input("Enter a Point: ");
for iteration = 1 : l
   num = 1;
   denum = 1;
   for i = 1 : l
       if(iteration ~= i)
           num = num * (p - B(i));
           denum = denum * (B(iteration) - B(i));
       end
   end
   x = x + (num / denum) * A(iteration);
end
f(p) = x;
o = input("Enter Order: ");
diff_f(p) = diff(f(p), p, o);
fprintf("No. of %d Differentiation Using Lagrange Inverse Interpolation at (Y = %.4f): %.4f\n", o, y, diff_f(y)); 
