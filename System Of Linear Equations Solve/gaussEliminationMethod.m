%Gauss Elimiantion Method with and without pivoting
clear all
clc
A = [0, 2, 3; 4, -3, 2; 2, 4, -3];
B = [46; 16; 12];
newMat = [A, B];
[row, column] = size(newMat);
for i = 1 : row - 1
    pc = newMat(i, i);
    pe = newMat(i, :);
    if(pc == 0)
        temp = newMat(i, :);
        newMat(i, :) = newMat(i + 1, :);
        newMat(i + 1, :) = temp;
        pc = newMat(i, i);
        pe = newMat(i, :);
    end
    for j = i + 1 : row
        m =  newMat(j, i) / pc;
        for k = i : length(pe)
           newMat(j, k) = newMat(j, k) - m * pe(k); 
        end
    end
end
A = newMat(:, 1 : column - 1);
B = newMat(:, column);
x = zeros(column - 1);
for i = row : -1 : 1
   temp = B(i);
   for j = 1 : column - 1
       if(j ~= i)
          temp = temp - A(i, j) * x(j);
       end
   end
   x(i) = temp / A(i, i);
end
disp("Solutions for Linear System of Equations are,")
for i = 1 : length(x)
   fprintf("x(%d): %.2f\n", i, x(i)); 
end