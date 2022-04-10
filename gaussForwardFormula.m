% Solve By Gauss Forward Formula
clear all
clc
center = 0;
A = [2.5 3.0 3.5 4.0 4.5 5.0]; 
B = [24.145 22.043 20.225 18.644 17.262 16.047];
h = A(2) - A(1);
newMat = differenceTable(A, B);
[m, n] = size(newMat);
x = input("Enter a Number: ");
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
p = (x - newMat(center, 1)) / h;
values = newMat(center, 2 : n);
temp = newMat(center + 1, 2 : n);
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
title('Gauss Forward Interpolation Formula')
title(legend, 'Pointers')
legend('Graph', 'Point')
text(x + .1, y, 'New Point')
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
        calculatedP = calculatedP / (p + temp);
    end
end
end