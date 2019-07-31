function [Z,E]=LRR_main(X,lambda,self_dic,norm)
addpath('public_code');
if(self_dic==1)%自身字典
    A=X;
else
    Q = orth(X');%使用正交基代替
    A = X*Q;
end
%————————————————————————————————————
%初始化
tol = 1e-2;
maxIter = 1e6;
[d n] = size(X);
m = size(A,2);
rho = 1.1;
max_mu = 1e10;
mu = 1e-6;

%辅助变量
J = zeros(m,n);
Z = zeros(m,n);
E = sparse(d,n);

%拉格朗日乘子
Y1 = zeros(d,n);
Y2 = zeros(m,n);
%——————————————————————————————————————
iter = 0;
atx = A'*X;
inv_a = inv(A'*A+eye(m));
while iter<maxIter
    iter = iter + 1;
    %更新 J ，SVT
    
    J = SVT(Z + Y2/mu,1/mu);
    
    % Z
    Z = inv_a*(atx-A'*E+J+(A'*Y1-Y2)/mu);
   
    % E
    xmaz = X-A*Z;
    temp = xmaz+Y1/mu;
    if (norm==1)%范数
        E = max(0,temp - lambda/mu)+min(0,temp + lambda/mu);%1范数，软阀值算法
    else
        E = solve_l1l2(temp,lambda/mu);
    end
    
    leq1 = xmaz-E;
    leq2 = Z-J;
    stopC = max(max(max(abs(leq1))),max(max(abs(leq2))));%无穷范数
   
    disp(iter)
    if stopC<tol 
        break;
    else
        Y1 = Y1 + mu*leq1;
        Y2 = Y2 + mu*leq2;
        mu = min(max_mu,mu*rho);
    end
end

if(self_dic==0)%正交基
    Z = Q*Z;
end


    

