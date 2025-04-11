function [ x, f, iter, time ] = linear_cg( A, b, x0, eps, itermax )
f = zeros(itermax,1);
x_old = x0;
g_old = A*x_old - b;
d_old = -g_old;

tic;
for iter = 1:itermax
   f(iter) = 1/2*x_old'*A*x_old - b'*x_old;
   if norm(g_old) <= eps
      break; 
   end
   
   alpha = g_old'*g_old/( d_old'*A*d_old );
   x = x_old + alpha*d_old;
   g = A*x - b;
   beta = g'*g/(g_old'*g_old);
   d = -g + beta*d_old;
   
   x_old = x;
   d_old = d;
   g_old = g;
end
time = toc;
f = f(1:iter);
iter = iter - 1;
end