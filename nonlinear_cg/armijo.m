function alpha = armijo(x, d, g, f)
alpha = 1;% ��ʼֵ
sigma = 1e-3;% ����sigma
for i=1:20 % ����������Ϊ 20
xn = x + alpha*d; 
fn = fun(xn);% f(xk+alpha*d)
% armijo ����
if fn <= f + sigma*alpha*g'*d
    break;
end
alpha = alpha*0.1;
end