function alpha = strong_wolfe(x, d, g, fk)
alpha = 1; 
% ����
sigma1 = 0.25;
sigma2 = 0.3;
%���䷨
a = 0; b = Inf; %�Ŵ����Сalpha�õ��Ĳ���

while (1) %һֱѭ��
    fn = fun(x + alpha*d); % f(x + alpha*d)
    gn = gfun(x + alpha*d); %g_k+1
    
    if fn > fk + sigma1*alpha*g'*d || gn'*d > - sigma2*g'*d  % �ж��Ƿ������1��ʽ�Ӻ͵�2��ʽ�������Ͻ�
        b = alpha;        
        alpha = (alpha + a)/2; % ��Сalpha
        continue; %��������ѭ����������һ��ѭ��
    end
 
    if gn'*d < sigma2*g'*d % �ж��Ƿ������2��ʽ�������½�
        a = alpha;
        alpha = min([2*alpha, (b+alpha)/2]); % �Ŵ�alpha
        continue;
    end
    break;
end
end