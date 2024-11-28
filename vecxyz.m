clc;
clear vars;
close all;

syms x y z;

f = input("Enter the input in vector form");

A = inline(vectorize(f(1)) , 'x' , 'y' , 'z');
B = inline(vectorize(f(2)) , 'x' , 'y' , 'z');
C = inline(vectorize(f(3)) , 'x' , 'y' , 'z');

x = linspace(-2, 2 , 5);
y=x;
z=x;

[X Y Z] = meshgrid(x , y ,z);

U = A(X , Y , Z);
V = B(X , Y , Z);
W = C(X , Y , Z);

quiver3(X , Y , Z , U ,V , W , 1);
axis on;