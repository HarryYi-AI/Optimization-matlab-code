clear all
clc

% 给定的数据
t1 = [1.0 2.0 1.0 2.0 0.1];
t2 = [1.0 1.0 2.0 2.0 0.0];
y = [0.13 0.22 0.08 0.13 0.19];

kmax = 5000;
x0 = [1; 1; 1]; % 初始参数 [x_1; x_2; x_3]
eps = 1e-5;
mu = 0.1;

% 调用 LMF 方法
[x, obj, iter, time] = LMF(kmax, x0, eps, mu);

% 绘图
figure
plot(t1, y, 'b*')
hold on
fit_y = x(1) * x(3) * t1 ./ (1 + x(1) * t1 + x(2) * t2);
plot(t1, fit_y, 'r-o')
hold off
