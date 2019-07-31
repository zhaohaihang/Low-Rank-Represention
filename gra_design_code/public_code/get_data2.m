function [fea] = get_data2(file_path,selected_num)%返回的矩阵每行一张图
disp(file_path)
file_path=strcat(file_path,'\');
img_num=selected_num;
dd=[];
for j = 1:img_num %逐一读取图像
      image =  imread([file_path,int2str(j),'.tif']);
      image=imresize(image,[32,32]);
      one_dimo=image(:)';%将矩阵转化为一维向量
      dd=[dd;one_dimo];%将多个一维向量合并成高维矩阵
end
fea=dd;


