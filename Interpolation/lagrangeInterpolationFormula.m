clear all
clc
A = [300, 304, 305, 307];
B = [2.4771, 2.4829, 2.4843, 2.4871];
l = length(B);
y = 0;
x = input("Enter a Point: ");
for iteration = 1 : l
   num = 1;
   denum = 1;
   for i = 1 : l
       if(iteration ~= i)
           num = num * (x - A(i));
           denum = denum * (A(iteration) - A(i));
       end
   end
   y = y + (num / denum) * B(iteration);
end
fprintf("Interpolated Value Using Lagrange Interpolation at (X = %d): %.4f\n", x, y); 
plot(A, B, 'red');
hold on
plot(x, y, 'black*')
xlabel('x-axis'); ylabel('y-axis')
title('Lagrange Interpolation Formula')
title(legend, 'Description')
legend('Given Data', 'New Point')
text(x + .2, y, 'New Point')
grid on
hold off
