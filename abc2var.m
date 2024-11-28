% Area between 2 curves with 2 points
clc
clear all
close all;

syms x;
y2 = x^2;
y1 = x;

D = [-2  2];

fplot(y1 , D)
hold on;
fplot(y2 , D)

poi = double(solve(y2-y1))

j = linspace(poi(1) , poi(2))

TA = abs(int(y2-y1 , poi(1) , poi(2)))

yy1 =subs(y1,x,j)
yy2 = subs(y2,x,j)
xx = [j,fliplr(j)]
yy = [yy2,fliplr(yy1)]
fill(xx,yy,'g')

