function g = gfun(x)
global n;
g1 = [-400*(x(2:n) - x(1:n-1).^2).*x(1:n-1) - 2*(1-x(1:n-1)); 0];
g2 = [0; 200*(x(2:n)-x(1:n-1).^2)];
g = g1+g2;
end