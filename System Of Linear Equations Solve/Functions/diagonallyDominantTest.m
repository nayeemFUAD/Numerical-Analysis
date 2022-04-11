function d = diagonallyDominantTest(A)
[row, column] = size(A);
count = 0;
for i = 1 : row
    te = abs(A(i, i));
    soe = 0;
    for j = 1 : column
        if(i ~= j)
        soe = soe + abs(A(i, j));
        end
    end
    if(te >= soe)
        count = count + 1;
    end
end
if(count == row)
    d = 1;
else
    d = 0;
end