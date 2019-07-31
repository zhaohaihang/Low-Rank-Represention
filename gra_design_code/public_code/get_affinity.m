function [W]=get_affinity(Z,class_num)
K=class_num;
[U,S,V] = svd(Z,'econ');
S = diag(S);                                                                                                     
   
r = sum(S>1e-4*S(1));%S(1）返回矩阵S的行数，
U = U(:,1:r);
S = S(1:r);
U = U*diag(sqrt(S));
U = normr(U);%标准化U的行
W = (U*U').^4;%亲和矩阵
