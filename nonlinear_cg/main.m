clear all;
clc;

global n;
n =5000;

x0 = zeros(n,1);
kmax = 50000;
eps = 1e-6;

[x, f, iter, time] = nonlinear_cg(kmax,eps,x0, @strong_wolfe, @PR);
m=1:iter;
figure;
hold on; % 保持先前的绘图
plot(m, f, 'r-', 'LineWidth', 2);
xlabel('Iteration');
ylabel('Function Value');
title('Nonlinear Conjugate Gradient Method ',n);
legend('Strong Wolfe-PR Condition'); % 添加图例
xlim([-5 1.1*iter]); % 设置x轴的范围
ylim([-50 1.1*n]); % 设置y轴的范围
grid on; % 添加网格线
hold off; % 取消保持绘图状态
% saveas(gcf, 'C:\Users\Romantique\Desktop\NonlinearCG_PR2.png');

[x1, f1, iter1, time1] = nonlinear_cg(kmax,eps,x0, @strong_wolfe, @FR);
m1=1:iter1;
figure;
hold on; % 保持先前的绘图
plot(m1, f1, 'r-', 'LineWidth', 2);
xlabel('Iteration');
ylabel('Function Value');
title('Nonlinear Conjugate Gradient Method ',n);
legend('Strong Wolfe-FR Condition'); % 添加图例
xlim([-5 1.1*iter1]); % 设置x轴的范围
ylim([-50 n*1.1]); % 设置y轴的范围
grid on; % 添加网格线
hold off; % 取消保持绘图状态
% saveas(gcf, 'C:\Users\Romantique\Desktop\NonlinearCG_FR2.png');
% 
% [x2, f2, iter2, time2] = nonlinear_cg(kmax,eps,x0, @armijo, @FR);
% m2=1:iter2;
% figure;
% hold on; % 保持先前的绘图
% plot(m2, f2, 'r-', 'LineWidth', 2);
% xlabel('Iteration');
% ylabel('Function Value');
% title('Nonlinear Conjugate Gradient Method ',n);
% legend('armijo-FR Condition'); % 添加图例
% xlim([-5 1.1*iter2]); % 设置x轴的范围
% ylim([-50 n*1.1]); % 设置y轴的范围
% grid on; % 添加网格线
% hold off; % 取消保持绘图状态
% % saveas(gcf, 'C:\Users\Romantique\Desktop\NonlinearCG_Armijo_FR2.png');

[x3,f3,iter3,time3]=steepest_descent_wolfe(x0,kmax,eps);%使用 wolfe 规则
m3=1:iter3;
figure;
hold on; % 保持先前的绘图
plot(m3, f3, 'r-', 'LineWidth', 2);
xlabel('Iteration');
ylabel('Function Value');
title('steepest-descent-wolfe ',n);
legend('steepest-descent-wolfe Condition'); % 添加图例
xlim([-5 1.1*iter3]); % 设置x轴的范围
ylim([-50 n*1.1]); % 设置y轴的范围
grid on; % 添加网格线
hold off; % 取消保持绘图状态
% saveas(gcf, 'C:\Users\Romantique\Desktop\s.png');



% 初始调用，绘制第一个条件的结果
[x, f, iter, time] = nonlinear_cg(kmax, eps, x0, @strong_wolfe, @PR);
m = 1:iter;

% 创建图形窗口并绘制第一个条件的结果
figure;
hold on; % 保持先前的绘图
plot(m, f, 'r-', 'LineWidth', 2, 'DisplayName', 'Strong Wolfe-PR');

% 继续在同一张图上绘制第二个条件的结果
[x1, f1, iter1, time1] = nonlinear_cg(kmax, eps, x0, @strong_wolfe, @FR);
m1 = 1:iter1;
plot(m1, f1, 'b-', 'LineWidth', 2, 'DisplayName', 'Strong Wolfe-FR');

% 继续在同一张图上绘制第三个条件的结果
[x3,f3,iter3,time3]=steepest_descent_wolfe(x0,kmax,eps)
m3 = 1:iter3;
plot(m3, f3, 'g-', 'LineWidth', 2, 'DisplayName', 'steepest-descent-wolfe');

% 设置图像的其他属性
xlabel('Iteration');
ylabel('Function Value');
title(['Nonlinear Conjugate Gradient Method ', num2str(n)]);
legend('show'); % 显示图例
axis tight; % 使图像更紧凑
grid on; % 添加网格线
hold off; % 取消保持绘图状态

% 优化图像显示，根据实际数据调整x轴和y轴的范围
xlim([-5 max(1.1*iter, 1.1*iter1, 1.1*iter3)]); % 根据需要调整x轴范围
ylim([1e-16 10]); % 根据需要调整y轴范围

% 保存图像到桌面
saveas(gcf, 'C:\Users\YourUsername\Desktop\NonlinearCG_Comparison.png');
