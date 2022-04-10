function newMatrix = differenceTable(A, B)
rows = 2 * length(B) - 1;
columns = length(B) + 1;
newMatrix = zeros(rows, columns);
index = 1;
for i = 1 : 2 : rows
    newMatrix(i, 1) = A(index);
    newMatrix(i, 2) = B(index);
    index = index + 1;
end

for j = 3 : 1 : columns
    for i = j - 1 : 2 : rows
        newMatrix(i, j) = newMatrix(i + 1, j - 1) - newMatrix(i - 1, j - 1);
    end
    rows = rows - 1;
end
end