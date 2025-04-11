function [x, f, iter, time] = Guass_newton(x0, kmax, eps)
x = x0;
f = zeros(kmax,1);
tic;
for iter = 1:kmax
    J = Jacob(x);
    r = residual(x);
    f(iter) = r'*r/2;
    g = J'*r; 
    if norm(g) <= eps
        break;
    end
    x = x - (J'*J)\g; 
end
time = toc;
iter = iter - 1;
f = f(1:iter);
end