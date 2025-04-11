function x=direct(A,b)
AtA = A'*A;  Atb = A'*b;
x = AtA\Atb;     
end

