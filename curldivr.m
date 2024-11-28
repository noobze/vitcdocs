clc;
clear vars;
close all;

syms x y z real;
f = input("Enter in vector form i,j,k");
curlf = curl(f , [x y z])
divr = divergence(f , [x y z])

if curlf == [0 0 0] % conservative
    poten = potential(f , [x y z])
else
    sprintf("Curl is not equal to 0")
end