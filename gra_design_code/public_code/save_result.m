function save_result(fea,idx,class,sample,path)

K=int32(str2double(class));
sum=int32(str2double(sample));

for i = 1:K
     mkdir(strcat(path,'\',int2str(i),'\'));       %% 在指定的文件路径下以变量名为名字创建新的文件夹
end

for i=1:sum
    temp=fea(i,:);
    temp=reshape(temp,32,32);
    temp= uint8(temp);
   
    img_path_list = dir(strcat(path,'\',int2str(idx(i)),'\','*.tif'));%获取该文件夹中所有jpg格式的图像
    img_num = length(img_path_list);%获取图像总数量
   
    imwrite(temp,strcat(path,'\',int2str(idx(i)),'\',num2str(img_num+1),'.tif'));
end