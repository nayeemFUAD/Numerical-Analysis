clear all
clc
syms p
A = [2.5 3.0 3.5 4.0 4.5 5.0]; 
B = [24.145 22.043 20.225 18.644 17.262 16.047];
l = length(B);
r = 2 * l - 1;
c = l + 1;
center = round(r / 2) - 1;
newMat = zeros(r, c);
index = 1;
for row = 1 : 2 : r
   newMat(row, 1) = A(index);
   newMat(row, 2) = B(index);
   index = index + 1;
end
for column = 3 : c
    for row = column - 1 : 2 : r
        newMat(row, column) = newMat(row + 1, column - 1) - newMat(row - 1, column - 1);
    end
    r = r - 1;
end
disp('Forward Difference Table')
disp(newMat)
x = input("Enter a Point: ");
for i = 1 : 2 : 2 * l - 1
   if(x > newMat(i, 1))
       center = i;
   end
end
values = newMat(center, 2 : c);
temp = newMat(center + 1, 2 : c);
for i = 1 : length(values)
   if(values(i) == 0)
       values(i) = temp(i);
   end
end
h = A(2) - A(1);
u = (x - newMat(center, 1)) / h;
y = values(1) + p * values(2);
for i = 3 : l
    term = p;
    n = 1;
    for j = 3 : i
       if(mod(j, 2) == 0)
           term = term * (p + n);
           n = n + 1;
       else
           term = term * (p - n);
       end
    end
    y = y + (term / factorial(i - 1)) * values(i);
end
o = input("Order of Differentiation: ");
f(p) = y;
diff_f(p) = (1 / h.^o) * diff(f(p), p, o);
fprintf("No. of %d Differentiation Value using Gauss Forward Interpolation at (X = %.4f): %.4f\n", o, x, diff_f(u));
function fact = factorial(n)
fact = 1;
while(n > 1)
    fact = fact * n;
    n = n - 1;
end
end
