function newMat = dividedDifferenceTable(A, B)
tolerance = .0001;
m = 2 * length(B) - 1;
n = length(B) + 1;
newMat = zeros(m, n);
index = 1;
for i = 1: 2 : m
    newMat(i, 1) = A(index);
    newMat(i, 2) = B(index);
    index = index + 1;
end
for i = 3 : 1 : n
   termCalculator(m, i);
   m = m - 1;
end

function termCalculator(row, col)
for k = col - 1 : 2 : row
    num = newMat(k - 1, col - 1) - newMat(k + 1, col - 1);
    denum = newMat(k - (col - 2), 1) - newMat(k + (col - 2), 1);
    if(abs(num/denum) < tolerance)
        newMat(k, col) = 0;
    else
        newMat(k, col) = num / denum;
    end
end
end
end