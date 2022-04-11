% Solved By Jacobi Iteration Method
clear all
clc
fprintf("\t\t\t\t\t\t\tSolved By Gauss Jacobi Iteration Method\n\n");
tolerance = .0001;
A = [1, 17, -2; 2, 2, 18; 30, -2, 3];
B = [48; 30; 48];
newMat = [A, B];
disp("Given System Of Linear Equations")
disp(newMat)
if(diagonallyDominantTest(A) == 0)
    disp("Given System of Linear Equations Are not in Diagonally Dominant Form")
    disp("Converting It into Diagonally Dominant Form")
    newMat = makeDiagonallyDominant(A, B);
    [R, C] = size(newMat);
    A = newMat(:, 1 : C - 1);
    B = newMat(:, C);
    disp(newMat)
end
if(diagonallyDominantTest(A) == 0)
    disp("Can't Able to Convert It Into Diagonally Dominant Form")
    disp("Can't Be Solved. Please Try Again.")
    return;
end
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