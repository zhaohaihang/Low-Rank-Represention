function [X]=data2one(data)
%归一化操作
    fea = double(data);
    fea = fea';
    fea = fea./repmat(sqrt(sum(fea.^2)),[size(fea,1) 1]);%每一列，l2范数归一化　
    X = fea;
end
