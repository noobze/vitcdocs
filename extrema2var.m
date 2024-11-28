clc
clear vars;
close all;

format compact;

syms x y real;
f = input("Enter a Function Value");
fx = diff(f , x);
fy = diff(f , y);


fxx = diff(fx , x); % R
fyy = diff(fy , y); % T
fxy = diff(fxx , y); % S

[ax , ay] = solve(fx , fy);



D = fxx*fyy - (fxy*fxy);

r=1;
for k=1:1:size(ax)
if (imag(ax(k))==0 && imag(ay(k))==0)
    ptx(r) = ax(k);
    pty(k) = ay(k);
    r=r+1;
end
end

% visualize the function
a1 = max(double(ax));
a2 = min(double(ax));
b1 = max(double(ay));
b2 = min(double(ay));

fsurf(f , [a2-0.5 a1+0.5 b2-0.5 b1+0.5]);
colormap("summer");
shading interp;
hold on;

for j=1:1:(r-1)
T1 = subs(subs(D , x , ptx(j)) , y , pty(j));
T2 = subs(subs(fxx , x , ptx(j)) , y , pty(j));

if T1 == 0
    sprintf("Futher investigation is required");
    double(ptx(j))
    double(pty(j))
elseif T1 < 0
    sprintf("Saddle Point")
    T3 = subs(subs(f , x , ptx(j)) , y , pty(j));
    sprintf("The value of function is %d" , T3);
    plot3(double(ptx(j)) , double(pty(j)) , double(T3));
else
    if T2 < 0
        sprintf("Maxima at point (%d , %d)" , ptx(j) , pty(j));
        T3 = subs(subs(f , x , ptx(j)) , y , pty(j));
        sprintf("The value of function %d" , double(T3));
        plot3(double(ptx(j)) , double(pty(j)) , double(T3))
    else
        sprintf("Minima at point (%d , %d)" , ptx(j) , pty(j));
        T3 = subs(subs(f , x , ptx(j)) , y , pty(j));
        sprintf("The value of function %d" , double(T3));
        plot3(double(ptx(j)) , double(pty(j)) , double(T3))
    end
end
end
