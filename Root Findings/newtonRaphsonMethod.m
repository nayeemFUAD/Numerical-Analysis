clear all
clc
f = @(x) (x.^3 - x - 1);
diff_f = @(x) (3 * x.^2 - 1);
tolerance = .001;
x(1) = input("Enter Your First Assumption: ");
if(abs(f(x(1))) < tolerance)
    disp("Your Assumption is Almost Exact Root Of The Equation");
    fprintf("Iteration 1: At (X = %.4f): f(%.4f) = %.4f\n", x(1), x(1), f(x(1)));
    fprintf("Root: %.4f\n", x(1));
    plot(x(1), f(x(1)), 'black*')
    hold on
    text(x(1), f(x(1)), '  Root')
else
    fprintf("Iteration 1: At (X = %.4f): f(%.4f) = %.4f\n", x(1), x(1), f(x(1)));
    i = 2;
while(1)
    x(i) = x(i - 1) - (f(x(i - 1))/ diff_f(x(i - 1)));
    fprintf("Iteration %d: At (X = %.4f): f(%.4f) = %.4f\n", i, x(i), x(i), f(x(i)));
    if(abs(f(x(i))) < tolerance)
        fprintf("Root: %.4f\nFound at %d No. Of Assumption.\n", x(i), i);
        plot(x(i), f(x(i)), 'black*')
        hold on
        text(x(i), f(x(i)), '  Root')
        break;
    end
    i = i + 1;
end
end
X = -2 : .01 : 2;
for i = 1 : length(X)
    Y(i) = f(X(i));
end
plot(X, Y, 'red')
xline(0, 'linewidth', 1.0, 'color', 'green')
yline(0, 'linewidth', 1.0, 'color', 'green')
title("Solved By Newton Raphson Method")
title(legend, "Description")
legend("Root", "Graph Of The Given Function", "X-Line", "Y-Line")
xlabel("X-Axis"); ylabel("Y-Axis")
grid on
hold off
