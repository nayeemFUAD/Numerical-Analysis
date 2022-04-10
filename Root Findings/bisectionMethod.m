%Find Root of an Equation Using Bisection Method
%TITAS P-47 EX-1
clear all
clc
f = @(x) (x.^2 - 4 * x - 10);
tollerance = .001;
c = 0;
lRange = input("Enter Lower Range Of The Given Continuous Function: ");
uRange = input("Enter Upper Range Of The Given Continuous Function: ");
if(f(lRange) * f(uRange) > 0)
    fprintf("There Exist No Root Within the interval [%d, %d]\n", lRange, uRange);
    disp("Please Try With Another Interval")
    return;
elseif(f(lRange) * f(uRange) == 0)
        if(f(lRange) == 0 && f(uRange) == 0)
            disp("Both Given Points Are Exact Root Of The Given Continuous Function")
            fprintf("Root 1: %d\nRoot 2: %d", lRange, uRange);
            c = 1;
            plot(lRange, f(lRange), 'black*');
            text(lRange + 1, f(lRange) + 1, "  Intersecting Point 1")
            hold on
            plot(uRange, f(uRange), 'black*');
            text(uRange + 1, f(uRange) + 1, "  Intersecting Point 2")
        elseif(f(lRange) == 0 && f(uRange) ~= 0)
            fprintf("Root: %d", lRange);
            plot(lRange, f(lRange), 'black*');
            hold on
            text(lRange + 1, f(lRange) + 1, "  Intersecting Point")
        else
            fprintf("Root: %d", uRange);
            plot(uRange, f(uRange), 'black*');
            hold on
            text(uRange + 1, f(uRange) + 1, "  Intersecting Point")
        end
else
    count = 0; i = 1; temp = 0;
    while(count == 0)
        x = (lRange + uRange) / 2;
        fprintf("Iteration %d: At(x = %.4f): f(%.4f) = %.4f\n", i, x, x, f(x));
        if(abs(round(f(x), 3)) <= tollerance)
            fprintf("\nRoot: %.4f\nFound at %d No. Iteration\n", x, i);
            plot(x, f(x), 'black*');
            text(x + 1, f(x) + 1, "  Intersecting Point")
            hold on
            break;
        else
            temp = f(x);
        end
        if(f(x) * f(uRange) < 0)
            lRange = x;
        elseif(f(lRange) * f(x) < 0)
            uRange = x;
        end
        i = i + 1;
    end
end
grid on
u = lRange - 5 : .01 : uRange + 5;
plot(u, f(u), 'red')
xlabel('X-Axis'); ylabel('Y-Axis');
title("Finding Root Using Bisection Method")
title(legend, 'Pointer')
xline(0, 'linewidth', 1.0, 'color', 'green'); yline(0, 'linewidth', 1.0, 'color', 'green');
if(c == 0)
    legend('Intersecting Point', 'Graph Of The Function')
else
    legend('Intersecting Point-1', 'Intersecting Point-2', 'Graph Of The Function')
end
grid on
hold off