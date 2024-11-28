% tangent of a function

syms x;
y = x^3;

x1 = -2;

D = [x1-2 x1+2];

fplot(y , D)
hold on;
yd = diff(y , x);
slope = subs(yd , x , x1);

y1 = subs(y , x , x1);

tn_line = slope* (x-x1) + y1;

fplot(tn_line , D)