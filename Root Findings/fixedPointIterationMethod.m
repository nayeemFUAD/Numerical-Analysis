%Solve By Fixed Point Iteration Method
clear all
clc
f = @(x) (x.^3 + x - 1);
g = @(x) (1 / (x.^2 + 1));
diff_g = @(x) ((-2*x) / (1 + x.^2).^2);
tollerance = 0.001;
disp("Choose an Option To Find The Root Using Iteration Method")
fprintf("1. Near a Given Point\n2. Within a Given Range\n");
n = input("Choice: ");
if(n == 1)
    iGuess = input("Enter Your Initial Guess: ");
    if(diff_g(iGuess) >= 1)
        disp("This Function Is not Convergent")
        return;
    end
elseif(n == 2)
    lRange = input("Enter Lower Range Of The Given Continuous Function: ");
    uRange = input("Enter Upper Range Of The Given Continuous Function: ");
    if(f(lRange) * f(uRange) < 0)
        fprintf("At Least One Root Lies Between The Given Range [%d, %d]\n", lRange, uRange);
    else
        fprintf("No Root Lies Between The Given Range [%d, %d]\m", lRange, uRange);
        return;
    end
    iGuess = (lRange + uRange) / 2;
else
    disp("Choose a Specific Option")
    disp("Please Try Again")
    return;
end
count = 0; i = 1;
while(count == 0)
   fprintf("Iteration %d: x(%d) = g(x(%d)) = g(%.4f) = %.4f\n", i, i, i - 1, iGuess, g(iGuess));
   error = abs(iGuess - g(iGuess));
   if(error <= tollerance || error == 0)
       fprintf("Approximate Root: %.4f\n", g(iGuess));
       fprintf("Found At %d No. Iteration\n", i);
       break;
   end
   iGuess = g(iGuess);
   i = i + 1;
end
grid on
if(n == 1)
   u = iGuess - 5 : .01 : iGuess + 5;
elseif(n == 2)
   u = lRange - 5 : .01 : uRange + 5; 
end
plot(u, f(u), 'red')
hold on
grid on
plot(iGuess, f(iGuess), '*', 'color', 'black')
text(iGuess, f(iGuess) + 1, '  Intersect')
xline(0, 'linewidth', 1.0, 'color', 'green'); yline(0, 'linewidth', 1.0, 'color', 'green');
xlabel('X-Axis'); ylabel('Y-Axis');
title("Finding Root Using Fixed Point Iteration Method")
title(legend, 'Pointer')
legend('Graph Of a Function', 'Intersecting Point')
hold off