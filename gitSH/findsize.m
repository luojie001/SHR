function [R] = findsize( f )
%�ҳ�f�����뾶
fb=removeb(f);
%Ѱ�����ֵ���ڵ�����
E_a=mean(f(:));%����
D_a=std2(f);%������
%*******ȥ����********
[m,n]=size(f);
s=ones(m,n)*(E_a+D_a);
s1=f-s;
s2=abs(s1);
image=(s1+s2)*0.5;%ȥ�������ͼƬ 
a=5; b=5;%ѡȡ�߽����Ϊ5
[xi,yi]=find(image==max(max(image(a:m-a,b:n-b))));%���ֵ���ڵ������
%���ֵ���ܶ��ֵ��ȡ��һ��������
xi=xi(1);
yi=yi(1);
%�����������ҳ��뾶
n1=0;s=0;w=0;e=0;
while (((image(xi-n1,yi))>0) &&((xi-n1)~=1))
    n1=n1+1;
end
while (((image(xi+s,yi))>0) &&((xi+s)~=m))
    s=s+1;
end
while (((image(xi,yi-w))>0)&&((yi-w)~=1))
    w=w+1;
end
while (((image(xi,yi+e))>0)&&((yi+e)~=n))
    e=e+1;
end
R=round((n+s+w+e)/4);
%figure,imshow(imagemb)
end

