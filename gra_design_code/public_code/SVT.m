function X = SVT(W,epsilon)
%    \min \epsilon||X||_* + 1/2 ||X-W||_F^2
%
[U,S,V] = svd(W,'econ');%保留对角线元素
s = max(diag(S)-epsilon, 0) + min(diag(S)+epsilon,0);%收缩算子
X = U*diag(s)*V';