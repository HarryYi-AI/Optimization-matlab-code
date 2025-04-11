function x=pcgfun(A,b)
AtA = A'*A;  Atb = A'*b;
x=pcg(AtA,Atb,1e-8,100); 
end