% Solve By Gauss Backward Formula
clear all
clc
center = 0;
A = [1939, 1949, 1959, 1969, 1979, 1989]; 
B = [12, 15, 20, 27, 39, 52];
h = A(2) - A(1);
newMat = differenceTable(A, B);
[m, n] = size(newMat);
x = input("Enter a Number: ");
%Set Center
for i = 3 : 2 : m
   if(x <= newMat(i, 1))
      center = i; 
      break;
   end
end
if(x > A(length(A)))
    center = round(m / 2);
    if(mod(center, 2) == 0)
        center = center + 1;
    end
end
p = (x - newMat(center, 1)) / h;
values = newMat(center, 2 : n);
temp = newMat(center - 1, 2 : n);
for i = 1 : length(values)
   if(values(i) == 0)
       values(i) = temp(i);
   end
end
y = values(1);
for i = 2 : length(values)
   y = y + values(i) * (pCalculator(p, i - 1) / factorial(i - 1));
end
disp(newMat)
fprintf("Output: %.4f\n", y);
plot(A, B);
hold on
plot(x, y, '*')
xlabel('x-axis')
ylabel('y-axis')
title('Gauss Backward Interpolation Formula')
title(legend, 'Pointers')
legend('Graph', 'Point')
text(x + 1, y, 'New Point')
grid on
hold off
function calculatedP = pCalculator(p, t)
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
        calculatedP = calculatedP / (p - temp);
    end
end
end