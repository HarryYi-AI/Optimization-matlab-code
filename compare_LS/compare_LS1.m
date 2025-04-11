clear all; clc;
n_size = 1000:1000:10000;
timeset1 = []; timeset2 = []; timeset3 = [];timeset4 = []; timeset5 = [];
for j = 1:nnz(n_size)
n = n_size(j); 
m = 2*n; 
A = rand(m,n); 
At = A'; 
b = rand(m,1);
tic;    
x1 = direct(A,b);     
time1 = toc;
timeset1 = [timeset1 time1];
tic;  
x2 = QR(A,b);
time2 = toc;    
timeset2 = [timeset2 time2]; 
tic;   
x3=cholesky(A,b);
time4 = toc;    
timeset4 = [timeset4 time4]; 
end
 
figure
hold on
plot(n_size,timeset1,'r-s');
plot(n_size,timeset2,'k-*');
plot(n_size,timeset4,'g--o');
legend('direct','QR','Chol','Location','NorthWest');
xlabel('n');
ylabel('Time');



