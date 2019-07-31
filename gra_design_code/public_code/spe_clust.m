function [idx]=spe_clust(W,K_iter,class_num)

K=class_num;
D = diag(1./sqrt(sum(W,2)));
E = D*W*D;%标准化的拉普拉斯
[U,S,V] = svd(E);
V = U(:,1:K);
V = D*V;
idx = kmeans(V,K,'emptyaction','singleton','replicates',K_iter,'display','off');