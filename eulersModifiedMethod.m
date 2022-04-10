%Euler's Modified Method to Solve ODE
%TITAS P-442 EX-17
clear all
clc
f = @(x, y) (x.^2 + y);
xVal(1) = 0;
yVal(1) = 1;
h = 0.1;
u = input("Enter a Point to Find it's Solution: ");
n = round(u / h) + 1;
for i = 2 : n
    xVal(i) = xVal(i - 1) + h;
end
for i = 2 : length(xVal)
    temp = 0;
    yVal(i) = yVal(i - 1) + h * f(xVal(i - 1), yVal(i - 1));
    for j = 1 : 10
       yVal(i) = yVal(i - 1) + (h/2) * (f(xVal(i - 1), yVal(i - 1)) + f(xVal(i), yVal(i)));
       if(yVal(i) == temp)
           break;
       else
           temp = yVal(i);
       end
     end
end
fprintf("The Solution Of The Given ODE at Point(x = %.2f): %.4f\n", u, yVal(length(yVal)));