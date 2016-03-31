function [c] = getSH(file_path)
%获取这个文件夹下fits文件的SH
img_path_list=dir(fullfile(file_path,'*.fit'));
%获取该文件夹中所有的fit格式的图像
img_num=length(img_path_list);
%获取图像总数量
  c=zeros(2,img_num);
 if img_num>0 %满足条件的图像
        for j=1:img_num
        image_name=img_path_list(j).name;%图像名
        image=fitsread(fullfile(file_path,image_name));
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
%*******最亮的星所在的区域***
         [imagem,imagemid]=find_maxpoitera(image);
         c(1,j)=SH(imagem);
         c(2,j)=SH(imagemid);
        end
    else fprintf('error------no *.fits in this file') ;   
 end

end

