clear all
clc
f = @(x) (x.^2 - 4 * x - 10);
tolerance = .001;
c = 1;
a = input("Enter Lower Range Of The Given Function: ");
b = input("Enter Upper Range Of The Given Function: ");
X = a : .01 : b;
if(f(a) * f(b) > 0)
    disp("There is no Root Exist Between These Given Range")
    return;
end
fprintf("There Exist At Least One Root Between The Given Range.\nThey Are:\n")
if(f(a) * f(b) == 0)
    if(f(a) == 0 && f(b) == 0)
        c = 0;
        fprintf("Root 1: %d\n Root 2: %d\n", a, b);
        plot(a, f(a), b, f(b), 'black*');
        hold on
        text(a + .1, f(a), 'Root 1');
        text(b + .1, f(b), 'Root 2');
    elseif(f(a) == 0 && f(b) ~= 0)
        fprintf("Root: %d\n", a);
        plot(a, f(a), 'black*')
        hold on
        text(a + .1, f(a), 'Root');
    else
        fprintf("Root: %d\n", b);
        plot(b, f(b), 'black*')
        hold on
        text(b + .1, f(b), 'Root');
    end
else
    i = 1;
    while(1)
        x = (a + b) / 2;
        fprintf("Iteration %d: At (x = %.4f): f(%.4f) = %.4f\n", i, x, x, f(x));
        if(abs(f(x)) < tolerance)
            fprintf("Root: %.4f\nFound After No. of %d Assumnption.\n", x, i);
            plot(x, f(x), 'black*');
            hold on
            break;
        end
        if(f(x) * f(a) < 0)
            b = x;
        else
            a = x;
        end
        i = i + 1;
    end
end
for i = 1 : length(X)
    Y(i) = f(X(i));
end
plot(X, Y)
title("Bisection Method Of Root Finding")
xline(0, 'linewidth', 1.0, 'color', 'green');
yline(0, 'linewidth', 1.0, 'color', 'green');
text(x + .1, f(x), 'Root');
title(legend, 'Description');
if(c)
    legend('Root', 'Graph of The Given Function', 'X-Axis',' Y-Axis')
else
    legend('Root 1', 'Root 2', 'Graph of The Given Function', 'X-Axis',' Y-Axis')
end
grid on
xlabel("X-Axis"); ylabel("Y-Axis");
hold off
