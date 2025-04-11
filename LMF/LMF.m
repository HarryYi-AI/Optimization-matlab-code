% LMF 方法
function [x, f, iter, time] = LMF(kmax, x0, eps, mu)
    x = x0;
    n = numel(x);
    f = zeros(kmax, 1);
    tic;
    for iter = 1:kmax
        r = residual(x);
        J = Jacob(x);
        g = J' * r;
        f(iter) = 0.5 * r' * r;
        if norm(g) <= eps
            break;
        end
        
        d = -(J' * J + mu * eye(n)) \ g;
        rn = residual(x + d);
        fn = 0.5 * rn' * rn;
        gamma = (fn - f(iter)) / (g' * d + 0.5 * d' * J' * J * d);
        
        if gamma > 0.75
            mu = 0.1 * mu;
        elseif gamma < 0.25
            mu = 10 * mu;
        end
        
        if gamma > 0
            x = x + d;
        end
    end
    iter = iter - 1;
    f = f(1:iter);
    time = toc;
end
