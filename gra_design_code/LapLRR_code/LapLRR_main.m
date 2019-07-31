function [Z,E]=LapLRR_main(X,lambda_lr,lambda_graph)
addpath('public_code');
 A=X;
AL_iters  = 1e6;
mu =1e-6;
Z0 = 0;
tol = 1e-2;
IF = inv(A'*A + 3*eye(c));

Z = IF*A'*X;


          
V1 = A*Z;              % V1
D1 = zeros(size(X));   
V2 = Z;
D2 = zeros(size(Z));
V3 = Z;
D3 = zeros(size(Z));
V4 = Z;
D4 = zeros(size(Z));
   
    options = [];
    options.NeighborMode = 'KNN';
    options.k = 5;
    options.WeightMode = 'Cosine';
    options.t = 1;
    W_graph = constructW(X',options); 
    D_graph = full(sum(W_graph,2));
    D_graph = spdiags(D_graph,0,N,N);
    L_graph = D_graph - W_graph;
    
i=1;
stopC = inf;

%--------------------------------------------------------------------------
while (i <= AL_iters) && (stopC >= tol)

    if mod(i,10) == 1
        Z0 = Z;
    end
    % ---------------------------------------------------------------------
    % 更新U
    Ztemp = A'*(V1+D1);
    Ztemp=Ztemp+V2+D2+V3+D3+V4+D4;
   
    Z = IF*Ztemp;
    
     V1 = (1/(1+mu)*(X+mu*(A*Z-D1)));
     V2 = SVT(Z-D2,lambda_lr/mu);
     V3 = (Z - D3)/(lambda_graph/mu*L_graph+eye(N));
     V4 = max(Z-D4,0);
  
    
    %----------------------------------------------------------------------
    % 更新拉格朗日乘子
    mse1 = A*Z-V1;
    D1 = D1 - mse1;
    stopC1 = norm(mse1,'fro');
    
     mse2 = Z-V2;
     D2 = D2 - mse2;
     stopC2 = norm(mse2,'fro');
     
     mse3 = Z-V3;
     D3 = D3 - mse3;
     stopC3 = norm(mse3,'fro');
     
     mse4 = Z-V4;
     D4 = D4 - mse4;
     stopC4 = norm(mse4,'fro');
     
     stopC=max(max(stopC1,stopC2),max(stopC3,stopC4));
    
    
    % 使原始残差和对偶残差更接近，加速迭代
    if mod(i,10) == 1
        res_p = stopC;
        res_d = norm(Z-Z0,'fro');
       
        if res_p > 10*res_d
            mu = mu*2;
            D1=D1/2; 
            D2=D2/2; 
            D3=D3/2; 
            D4=D4/2; 
            
        elseif res_d > 10*res_p
            mu = mu/2;
            D1=D1*2; 
            D2=D2*2; 
            D3=D3*2; 
            D4=D4*2; 
        end
    end
   
    disp(i)
    i=i+1;
end

E = X - A*Z;










    