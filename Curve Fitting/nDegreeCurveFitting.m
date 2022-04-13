clear all
clc
X = [-2, -1, 0, 1, 2];
Y = [40, 50, 62, 58, 60];
l = length(Y);
o = input("Enter Order of The Given Equation: ");
sum_Xn(1) = 0;
sum_XnY(1) = 0;
for i = 1 : l
    Xn_Table(i, 1) = X(i);
    sum_Xn(1) = sum_Xn(1) + Xn_Table(i, 1);
    XnY_Table(i, 1) = Y(i);
    sum_XnY(1) = sum_XnY(1) + XnY_Table(i, 1);
end
for c = 2 : 2 * o
   sum_Xn(c) = 0;
   for r = 1 : l
      Xn_Table(r, c) = Xn_Table(r, 1).^c; 
      sum_Xn(c) = sum_Xn(c) + Xn_Table(r, c);
   end
end
for c = 2 : o + 1
   sum_XnY(c) = 0;
   for r = 1 : l
   XnY_Table(r, c) = Xn_Table(r, c - 1) * Y(r); 
   sum_XnY(c) = sum_XnY(c) + XnY_Table(r, c);
   end
end
newMat = [XnY_Table(:, 1), Xn_Table, XnY_Table(:, 2 : o + 1)];
summation = [sum_XnY(1), sum_Xn(1, :), sum_XnY(2 : o + 1)];
disp(newMat)
disp(summation)
for r = 1 : o + 1
    index = r - 1;
    for c = 1 : o + 1
        if(index == 0)
            A(r, c) = l;
            index = index + 1;
            continue;
        end
            A(r, c) = sum_Xn(index);
            index = index + 1;
    end
end
points = sum_XnY / A;
fprintf("The Required Polynomial Equation of Order %d:\n", o);
fprintf("y = ");
for i = 1 : o + 1
   fprintf("+ (%.4f)x^%d ", points(i), i - 1); 
end
fprintf("\n");
for row = 1 : l
    B(row) = points(1);
    for column = 1 : o
        B(row) = B(row) + Xn_Table(row, column) * points(column + 1);
    end
end
plot(X, Y, 'red')
hold on
grid on
xlabel('X-Axis'); ylabel('Y-Axis');
plot(X, B, 'blacko')
title("Curve Fitting of n-Degree Polynomial")
title(legend, 'Pointers')
legend('Unfitted Graph', 'Fitted Points')