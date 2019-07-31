function [Z,L,E]=LatLRR_main(X,lambda,self_dic,norm)
addpath('public_code');
if(self_dic==1)%自身字典
   A=X;
   B=X;
else%正交基
 Q1 = orth(X');
 Q2 = orth(X);
 A = X*Q1;
 B = Q2'*X;
end

%初始化
rho = 1.5;
alpha = 1.0;
tol = 1e-2;
maxIter = 1e6;
[d, n] = size(X);
nA = size(A,2);
dB = size(B,1);

max_mu = 1e10;
mu = 1e-6;
ata = A'*A;
bbt = B*B';
inv_ata = inv(ata+eye(nA));
inv_bbt = inv(bbt+eye(dB));
%辅助变量
J = zeros(nA,n);
Z = zeros(nA,n);
S = zeros(d,dB);
L = zeros(d,dB);
E = sparse(d,n);
%拉格朗日乘子
Y1 = zeros(d,n);
Y2 = zeros(nA,n);
Y3 = zeros(d,dB);

%main
iter = 0;

while iter<maxIter
    iter = iter + 1;
    %更新 J。SVT
    J=SVT(Z + Y2/mu,1/mu);
    
    %更新 S，SVT
    S=SVT(L + Y3/mu,alpha/mu);
   
    %更新 Z
    Z = inv_ata*(A'*X-A'*L*B-A'*E+J+(A'*Y1-Y2)/mu);
    
    %更新 L
    L = (X*B'-A*Z*B'-E*B'+S+(Y1*B'-Y3)/mu)*inv_bbt; 
    
    %更新 E
    temp = X-A*Z-L*B+Y1/mu;
    if (norm==1)%范数，软阀值
        E = max(0,temp - lambda/mu)+min(0,temp + lambda/mu);
    else
        E = solve_l1l2(temp,lambda/mu);
    end
   
    leq1 = X-A*Z-L*B-E;
    leq2 = Z-J;
    leq3 = L-S;
    stopC = max(max(max(abs(leq1))),max(max(abs(leq2))));
    stopC = max(max(max(abs(leq3))),stopC);
   
    disp(iter)
    if stopC<tol 
        break;
    else%拉格朗日乘子
        Y1 = Y1 + mu*leq1;
        Y2 = Y2 + mu*leq2;
        Y3 = Y3 + mu*leq3;
        mu = min(max_mu,mu*rho);
    end
end
if(self_dic==0)%正交基
   Z = Q1*Z;
   L = L*Q2';
end














