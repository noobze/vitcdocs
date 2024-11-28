% area between curves
clc;
clear all;
close all;
syms x
y1 = x^4 - 4*x^2 + 4;
y2 = x^2;

soln = solve(y1-y2)
poi = sort(double(soln))

pmax = max(poi);
pmin = min(poi);

D = [pmin-1, pmax+1];

fplot(y1 , D);
hold on;
grid on;
fplot(y2 , D);

n = length(poi);
total_area = 0;
if n>2
    for k=1:n-1
        fx = int(y1-y2 , poi(k) , poi(k+1));
        total_area = total_area+abs(fx);
        interval = linspace(poi(k) , poi(k+1));

        yy1 = subs(y1 , x , interval);
        yy2 = subs(y2 , x , interval);

        polyx = [interval , fliplr(interval)];
        polyy = [yy1 , fliplr(yy2)];
        fill(polyx , polyy , 'g');
    end
else
    j = linspace(poi(1) , poi(2));
    total_area = abs(int(y2-y1 , poi(1) , poi(2)));
    
    yy1 =subs(y1,x,j);
    yy2 = subs(y2,x,j);
    xx = [j,fliplr(j)];
    yy = [yy2,fliplr(yy1)];
    fill(xx,yy,'g');

end