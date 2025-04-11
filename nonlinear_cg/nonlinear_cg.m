function [x, f, iter, time] = nonlinear_cg(kmax,eps,x0, searching, para)
f = zeros(kmax,1);
tic;
x_old = x0;
g_old = gfun(x_old);
d_old = -g_old;

iter = 0; % 初始化迭代计数器
    tic;
    x_old = x0;
    g_old = gfun(x_old);
    d_old = -g_old;
    while iter < kmax && norm(g_old) > eps
        iter = iter + 1; % 更新迭代计数器
        f(iter) = fun(x_old);
        alpha = searching(x_old, d_old, g_old, f(iter));
        x = x_old + alpha*d_old;
        g = gfun(x);
        beta = para(g_old, g);
        d = -g + beta*d_old;
        x_old = x;
        g_old = g;
        d_old = d;
    end
    time = toc;
    iter = iter - 1; % 减去最后一次迭代
    f = f(1:iter); % 只保留有效的函数值
    
%     
% for iter = 1:kmax
%     f(iter) = fun(x_old);
%     if norm(g_old) <= eps
%         break;
%     end
%     alpha = searching(x_old, d_old, g_old, f(iter));
%     x = x_old + alpha*d_old;
%     g = gfun(x);
%     beta = para(g_old, g);
%     d = -g + beta*d_old;
%     x_old = x;
%     g_old = g;
%     d_old = d;
% end
% time = toc;
% iter = iter - 1;
% f = f(1:iter);
end

