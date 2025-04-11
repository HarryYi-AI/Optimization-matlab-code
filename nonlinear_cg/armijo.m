function alpha = armijo(x, d, g, f)
alpha = 1;% 初始值
sigma = 1e-3;% 参数sigma
for i=1:20 % 最大迭代次数为 20
xn = x + alpha*d; 
fn = fun(xn);% f(xk+alpha*d)
% armijo 规则
if fn <= f + sigma*alpha*g'*d
    break;
end
alpha = alpha*0.1;
end