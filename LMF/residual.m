% 残差函数
function r = residual(x)
    global t1 t2 y
    r = y - (x(1) * x(3) * t1) ./ (1 + x(1) * t1 + x(2) * t2);
end
