% finding extrema of a function

syms x;
f = 4*x^3 - 3*x;

fd = diff(f , x);
c = solve(fd);
cmax = max(double(c))
cmin = min(double(c))

fdd = diff(fd , x);

fplot(f , [cmin-2 cmax+2])
hold on
grid on

for i=1:1:length(c)
    j = subs(fdd , x, c(i))
    k = subs(f , x , c(i))
    if double(j) == 0
        sprintf("The inflexing point is %d" , double(c(i)))
    else
        if double(j) < 0
            sprintf("Maxima Point %d" , double(c(i)))
        else 
            sprintf("Minima Point %d" , double(c(i)))
        end
    end
    plot(c(i) , k , "r*")
end


