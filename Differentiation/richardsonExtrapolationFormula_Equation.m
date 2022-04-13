%Richardson Extrapolaton Formula
clear all
clc
f =@(x) (x * exp(x));
h = .2;
u = input("Enter a Point to Find it's Derivative: ");
AVh = (f(u + h) - f(u - h)) / (2 * h);
h = h / 2;
AVh_2 = (f(u + h) - f(u - h)) / (2 * h);
TV = AVh_2 + (AVh_2 - AVh) / 3;
fprintf("Derivative at x(%.2f): %.4f\n", u, TV);
