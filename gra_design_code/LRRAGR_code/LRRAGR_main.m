function [Z,S,U,F,E] = LRRAGR_main(X,F_ini,Z_ini,LRRAGR_class_num,lambda1,lambda2,lambda3)
addpath('public_code');
[m,n] = size(X);
% ---------- Initilization -------- %
miu = 1e-2;
rho = 1.2;
max_miu = 1e8;
tol  = 1e-5;
tol2 = 1e-2;
C1 = zeros(m,n);
C2 = zeros(n,n);
C3 = zeros(n,n);
E  = zeros(m,n);

max_iter= 80;
Ctg = inv(X'*X+2*eye(size(X,2)));

distX = L2_distance_1(X,X);  

Z = Z_ini;
F = F_ini;
S = Z_ini;
U = Z_ini;
for iter = 1:max_iter
    S_old = S;
    U_old = U;
    Z_old = Z;
    E_old = E;
    %  Z
    Z = Ctg*(X'*(X-E+C1/miu)+S+U-(C2+C3)/miu);
    Z = Z- diag(diag(Z));
    % S 
    distF = L2_distance_1(F',F');            % º∆À„vij
    dist  = distX+lambda1*distF;
    S     = Z+(C2-dist)/miu;
    S     = S - diag(diag(S));
    for ic = 1:n
        idx    = 1:n;
        idx(ic) = [];
        S(ic,idx) = EProjSimplex_new(S(ic,idx));         
    end
    %  F 
    LS = (S+S')/2;
    L = diag(sum(LS)) - LS;
    [F, ~, ev] = eig1(L, LRRAGR_class_num, 0);

    % U
    U=SVT(Z+C3/miu,lambda2/miu);
    
    % E
    temp1 = X-X*Z+C1/miu;
    temp2 = lambda3/miu;
    E = max(0,temp1-temp2) + min(0,temp1+temp2);   
    % C1 C2 C3 miu
    L1 = X-X*Z-E;
    L2 = Z-S;
    L3 = Z-U;
    C1 = C1+miu*L1;
    C2 = C2+miu*L2;
    C3 = C3+miu*L3;
    
    LL1 = norm(Z-Z_old,'fro');
    LL2 = norm(S-S_old,'fro');
    LL3 = norm(U-U_old,'fro');
    LL4 = norm(E-E_old,'fro');
    SLSL = max(max(max(LL1,LL2),LL3),LL4)/norm(X,'fro');
    if miu*SLSL < tol2
        miu = min(rho*miu,max_miu);
    end
    % --------- obj ---------- %
    leq1 = max(max(abs(L1(:))),max(abs(L2(:))));
    stopC = max(leq1,max(abs(L3(:))));
    disp(iter)
    if stopC < tol
        break;
    end   
end
