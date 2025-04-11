function r = residual(x)
global t y
r=x(2)*log(1-x(1)*t)-y;
end