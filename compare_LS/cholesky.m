function x=cholesky(A,b)
AtA = A'*A;  Atb = A'*b;
L = chol(AtA,'lower'); x = L\Atb; x = L'\ x;
end