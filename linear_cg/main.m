clear all
clc

%n = 1000;
%rng(10,'twister')
%A = rand(n);
%gamma =100;
%A = A'*A + gamma*eye(n);
%b = rand(n,1);

% n = 10;
% B = rand(n);
% [ Q, R ] = qr(B);
% d = [ ones(5,1); 2*ones(5,1) ];
% A = Q * diag(d) * Q';
% b = rand(n,1);
% 
% x0 = zeros(n,1);
% eps = 1e-5;
% itermax = 5000;
x0=zeros(100,1); 
itermax=5000; 
eps=1e-6; 

A=zeros(100,100); 
A(1,1)=1; 
A(1,2)=-1; 
A(100,99)=-1; 
A(100,100)=2; 
for i =2:99 
 A(i,i-1)=-1; 
 A(i,i)=2; 
 A(i,i+1)=-1; 
end
A = 2*A;
B=zeros(100,1); 
B(1,1)=1; 
B= 2*B;

[ x, f, iter, time ] = linear_cg( A, B, x0, eps, itermax )
