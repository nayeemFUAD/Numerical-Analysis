%Richardson Extrapolaton Formula
clear all
clc
x = [1, 2, 3, 4, 5];
y = [2, 4, 8, 16, 32];
h = 2;
u = input("Enter a Point to Find it's Derivative: ");
AVh = (y(u + h) - y(u - h)) / (2 * h);
h = h / 2;
AVh_2 = (y(u + h) - y(u - h)) / (2 * h);
TV = AVh_2 + (AVh_2 - AVh) / 3;
fprintf("Derivative at x(%.2f): %.4f\n", u, TV);
