clc;
clear vars;
close all;

syms x y lam real;

f = input("Enter the function: ");
g = input("Enter the constraint: ");

F = f + g * lam;

fx = diff(F, x);
fy = diff(F, y);

[ax, ay, alam] = solve([fx, fy, g], x, y, lam);

ax = double(ax);
ay = double(ay);

r = 1;
for k = 1:length(ax)
    if imag(ax(k)) == 0 && imag(ay(k)) == 0
        ptx(r) = ax(k);
        pty(r) = ay(k);
        r = r + 1;
    end
end

f_numeric = matlabFunction(f, 'Vars', [x, y]);
g_numeric = matlabFunction(g, 'Vars', [x, y]); 

t = f_numeric(ptx, pty);


figure(1);
for j = 1:length(t)
    D = [ptx(j) - 3, ptx(j) + 3, pty(j) - 3, pty(j) + 3];
    fcontour(f_numeric, D, 'LineWidth', 1.5);
    hold on;
    fcontour(g_numeric, D, 'LineStyle', '--', 'LineWidth', 1.5);
    plot(ptx(j), pty(j), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
end

f_min = min(t);
f_max = max(t);

fprintf('Minimum value of f: %.3f\n', f_min);
fprintf('Maximum value of f: %.3f\n', f_max);
