function newMat = makeDiagonallyDominant(A, B)
[row, column] = size(A);
for i = 1 : row
for n = 1 : row -1
    te = abs(A(n, n));
    sum = 0;
    for c = 1 : column
       if(n ~= c)
           sum = sum + abs(A(n, c));
       end
    end
    if(te < sum)
        tempA = A(n, :);                tempB = B(n); 
        A(n, :) = A(n + 1, :);          B(n) = B(n + 1);
        A(n + 1, :) = tempA;            B(n + 1) = tempB;
    end
end
end
newMat = [A, B];
end