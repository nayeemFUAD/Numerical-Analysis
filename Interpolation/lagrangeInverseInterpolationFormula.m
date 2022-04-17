clear all
clc
A = [168, 120, 72, 63];
B = [3, 7, 9, 10];
l = length(B);
x = 0;
y = input("Enter a Point: ");
for iteration = 1 : l
   num = 1;
   denum = 1;
   for i = 1 : l
       if(iteration ~= i)
           num = num * (y - B(i));
           denum = denum * (B(iteration) - B(i));
       end
   end
   x = x + (num / denum) * A(iteration);
end
fprintf("Interpolated Value Using Lagrange Inverse Interpolation at (Y = %.4f): %.4f\n", y, x); 
plot(A, B, 'red');
hold on
plot(x, y, 'black*')
xlabel('x-axis'); ylabel('y-axis')
title('Lagrange Inverse Interpolation Formula')
title(legend, 'Description')
legend('Given Data', 'New Point')
text(x + .2, y, 'New Point')
grid on
hold off
