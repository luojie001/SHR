function [c] = getSH(file_path)
%��ȡ����ļ�����fits�ļ���SH
img_path_list=dir(fullfile(file_path,'*.fit'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
  c=zeros(2,img_num);
 if img_num>0 %����������ͼ��
        for j=1:img_num
        image_name=img_path_list(j).name;%ͼ����
        image=fitsread(fullfile(file_path,image_name));
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
%*******�����������ڵ�����***
         [imagem,imagemid]=find_maxpoitera(image);
         c(1,j)=SH(imagem);
         c(2,j)=SH(imagemid);
        end
    else fprintf('error------no *.fits in this file') ;   
 end

end

