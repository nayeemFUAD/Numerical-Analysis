% Solved By Jacobi Iteration Method
clear all
clc
fprintf("\t\t\t\t\t\t\tSolved By Gauss Jacobi Iteration Method\n");
A = [1, 17, -2; 2, 2, 18; 30, -2, 3];
B = [48; 30; 48];
disp("Given Matrix")
disp([A, B])
if(~diagonallyDominantTest(A))
    disp("Given Matrix Data's Are Not Diagonally Dominant")
    disp("Trying to Convert it Into Diagonally Dominant Matrix")
    [r, c] = size(A);
    for iteration = 1 : r
        for row = 1 : r - 1
            sum = 0;
            for column = 1 : c
                if(row ~= column)
                    sum = sum + A(row, column);
                end
            end
            if(A(row, row) < sum)
                tempA = A(row, :);                      tempB = B(row);
                A(row, :) = A(row + 1, :);              B(row) = B(row + 1);
                A(row + 1, :) = tempA;                   B(row + 1) = tempB;
            end
        end
    end
    disp([A, B])
    if(~diagonallyDominantTest(A))
        disp("This Given Matrix Cann't Be Convert Into a Diagonally Dominant Matrix")
        return;
    end
end
n = input("No. Of Iteration: ");
initial = zeros(1, c);
for i = 1 : n
    for row = 1 : r
        sum = 0;
        for column = 1 : c
            if(row ~= column)
                sum = sum + A(row, column) * initial(column);
            end
        end
        values(row) = (B(row) - sum) / A(row, row);
    end
    initial = values;
end
fprintf("After No. of %d Iteration We get\n", n);
for i = 1 : length(initial)
    fprintf("X(%d) = %.4f\n", i, initial(i));
end
function d = diagonallyDominantTest(A)
[r, c] = size(A);
count = 0;
d = 0;
for row = 1 : r
    sum = 0;
    for column = 1 : c
        if(row ~= column)
            sum = sum + A(row, column);
        end
    end
    if(A(row, row) >= sum)
        count = count + 1;
    end
end
if(count == 3)
    d = 1;
end
end