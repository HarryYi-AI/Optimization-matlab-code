function x=QR(A,b)
AtA = A'*A;  Atb = A'*b;
[Q,R] = qr(AtA);  
x = Q'*Atb;  
x = R\x;
end