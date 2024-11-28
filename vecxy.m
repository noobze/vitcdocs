clc;
clear vars;
close all;

syms x y

f = input("Enter the function in vectorize form");

A = inline(vectorize(f(1)) , 'x' , 'y');
B = inline(vectorize(f(2)) , 'x' , 'y');

x = linspace(-1 , 1 , 10);
y = x;

[X , Y] = meshgrid(x,y);

U = A(X , Y);
V = B(X, Y);

quiver(X ,Y , U , V , 1);
axis on;
xlabel('x');
ylabel('y');