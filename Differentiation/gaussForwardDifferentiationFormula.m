% Solve By Gauss Forward Differentiation Formula
clear all
clc
syms p
center = 0;
A = [2.5 3.0 3.5 4.0 4.5 5.0]; 
B = [24.145 22.043 20.225 18.644 17.262 16.047];
h = A(2) - A(1);
newMat = differenceTable(A, B);
[m, n] = size(newMat);
x = input("Enter a Number: ");
o = input("Enter Order of The Differential Equation: ");
%Set Center
for i = 1 : 2 : m
   if(x >= newMat(i, 1))
      center = i; 
   end
end
if(x >= A(length(A)))
    center = round(m / 2);
    if(mod(center, 2) == 0)
        center = center + 1;
    end
end
u = (x - newMat(center, 1)) / h;
values = newMat(center, 2 : n);
temp = newMat(center + 1, 2 : n);
for i = 1 : length(values)
   if(values(i) == 0)
       values(i) = temp(i);
   end
end
y = values(1);
for i = 2 : length(values)
   y = y + values(i) * (pCalculator(i - 1) / factorial(i - 1));
end
disp(newMat)
diff_y(p) = (1 / h.^o) * diff(y, p, o);
fprintf("%d No. Derivative at Point (x = %.2f): %.4f\n", o, x, diff_y(u));
function calculatedP = pCalculator(t)
syms p
calculatedP = p;
term = floor(t / 2);
if t > 1
    if(mod(t, 2) ~= 0)
        while term > 0
            calculatedP = calculatedP * (p - term) * (p + term);
            term = term - 1;
        end
    else
        temp = term;
        while term > 0
            calculatedP = calculatedP * (p -term) * (p + term);
            term = term - 1; 
        end
        calculatedP = calculatedP / (p + temp);
    end
end
end