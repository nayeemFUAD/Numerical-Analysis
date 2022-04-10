%Find Root of an Equation Using Newton Raphson Method
clear all
clc
f = @(x) (x.^3 - x - 1);
diff_f = @(x) (3 * x.^2 - 1);
tollerance = 0.001;
lRange = input("Enter Lower Range Of The Given Continuous Function: ");
uRange = input("Enter Upper Range Of The Given Continuous Function: ");
if(f(lRange) * f(uRange) < 0)
    fprintf("At Least One Root Lies Between The Given Range [%d, %d]\n", lRange, uRange);
else
    fprintf("No Root Lies Between The Given Range [%d, %d]\m", lRange, uRange);
    return;
end
iGuess = (lRange + uRange) / 2;
if(f(iGuess) == 0)
    printf("Root: %.4f\n", iGuess);
else
    i = 1;
    fprintf("Iteration %d: At(x = %.4f): f(%.4f) = %.4f\n", i, iGuess, iGuess, f(iGuess));
    count = 0; i = 2; temp = f(iGuess);
    while(count == 0)
       x = iGuess - (f(iGuess) / diff_f(iGuess));
       fprintf("Iteration %d: At(x = %.4f): f(%.4f) = %.4f\n", i, x, x, f(x));
       if(abs(round(f(x), 3)) <= tollerance)
           fprintf("\nRoot: %.4f\nFound at %d No. Iteration\n", x, i);
           break;
       else
           temp = f(x);
       end
       iGuess = x;
       i = i + 1;
    end
end
u = lRange - 5 : .01 : uRange + 5;
plot(u, f(u), 'red')
hold on
grid on
plot(iGuess, f(iGuess), 'black*')
text(iGuess + 1, f(iGuess) + 1, "  Intersecting Point")
xlabel('X-Axis'); ylabel('Y-Axis');
title("Finding Root Using Newton Raphson Method")
title(legend, 'Pointer')
xline(0, 'linewidth', 1.0, 'color', 'green'); yline(0, 'linewidth', 1.0, 'color', 'green');
legend('Graph Of a Function', 'Intersecting Point')
hold off