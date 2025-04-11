clear all
clc

global t y
t = [2000 5000 10000 20000 30000 50000];
m = [0.9427 0.8616 0.7384 0.5362 0.3739 0.3096];
y = log(m);

x0 = [500;1];
kmax = 5000;
eps = 1e-5;
[x, f, iter, time] = Guass_newton(x0, kmax, eps);

figure
plot(t,y,'*')
hold on
fit_y = x(2)*log(1-x(1)*t);
plot(t,fit_y,'r-s')
hold off
