function [ c] = SHR_newdate( file_path )
%��ȡͼƬ�������������
img_path_list=dir(fullfile(file_path,'*.fits'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
  %c=zeros(3,img_num);
  k=0;
 if img_num>0 %����������ͼ��
        for j=1:img_num
        image_name=img_path_list(j).name;%ͼ����
        image=fitsread(fullfile(file_path,image_name));
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
        if max(max(removeb_newdate(image)))~=0
            k=k+1;
        [imagem,imagemid]=find_maxpoitera(image);
         c(1,k)=SH(imagem);
         c(2,k)=SH(imagemid);
%******�޳���Ч����*****
        while c(1,k)==0||c(2,k)==0
            k=k-1;
        end
        else   
       fprintf('��ЧͼƬ\n');
        end
        end
    else fprintf('error------no *.fits in this file') ;   
 end
end

