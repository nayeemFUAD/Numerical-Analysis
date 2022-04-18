clear all
clc
syms p
A = [1939, 1949, 1959, 1969, 1979, 1989]; 
B = [12, 15, 20, 27, 39, 52];
l = length(B);
r = 2 * l - 1;
c = l + 1;
center = round(r / 2) + 1;
newMat = zeros(r, c);
index = 1;
for i = 1 : 2 : r
   newMat(i, 1) = A(index);
   newMat(i, 2) = B(index);
   index = index + 1;
end
for column = 3 : c
    for row = column - 1 : 2 : r
        newMat(row, column) = newMat(row + 1, column - 1) - newMat(row - 1, column - 1);
    end
    r = r - 1;
end
disp("Backward Difference Table")
disp(newMat)
x = input("Enter a Point: ");
h = A(l) - A(l - 1);
for i = 1 : 2 * l - 1
   if(x < newMat(i, 1))
       center = i;
       break;
   end
end
u = (x - newMat(center, 1)) / h;
values = newMat(center, 2 : c);
temp = newMat(center - 1, 2 : c);
for i = 1 : length(values)
   if(values(i) == 0)
       values(i) = temp(i);
   end
end
y = values(1) + p * values(2);
for i = 3 : l
    temp = p;
    n = 1;
    for j = 3 : i
        if(mod(j, 2) == 0)
           temp = temp * (p - n);
           n = n + 1;
        else
            temp = temp * (p + n);
        end
    end
    y = y + (temp / factorial(i-1)) * values(i);
end
f(p) = y;
o = input("Enter Order: ");
diff_f(p) = (1 / h.^o) * diff(f(p), p, o);
fprintf("No. of %d Differentiation Value using Gauss Backward Interpolation at (X = %.4f): %.4f\n", o, x, diff_f(u));
function fact = factorial(n)
fact = 1;
while(n > 1)
    fact = fact * n;
    n = n - 1;
end
end
