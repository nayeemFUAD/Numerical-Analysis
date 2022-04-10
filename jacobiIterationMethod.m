% Solved By Jacobi Iteration Method
clear all
clc
tolerance = .0001;
A = [10, -5, -2; 4, -10, 3; 1, 6, 10];
B = [3; -3; -3];
[row, column] = size(A);
previousX = zeros(1, column);
presentX = previousX;
condition = 0;
iteration = 1;
while(condition == 0)
   for i = 1 : row
       X = B(i);
       for j = 1 : column
          if(i ~= j)
              X = X - A(i, j) * previousX(j);
          end
       end
       X = X / A(i, i);
       presentX(i) = X;
   end
   count = 0;
   for k = 1 : length(presentX)
      if(abs(previousX(k) - presentX(k)) < tolerance)
          count = count + 1;
      end
   end
   if(count == length(presentX))
      fprintf("Solution Of the Given System of Equations Found Between %d and %d No. Iteration\n", iteration - 1, iteration);
      for index = 1 : length(presentX)
         fprintf("x(%d): %.4f\n", index, presentX(index)); 
      end
      break;
   end
   previousX = presentX;
   iteration = iteration + 1;    
end