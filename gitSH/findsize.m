function [R] = findsize( f )
%找出f的最大半径
fb=removeb(f);
%寻找最大值所在的区域
E_a=mean(f(:));%期望
D_a=std2(f);%均方差
%*******去背景********
[m,n]=size(f);
s=ones(m,n)*(E_a+D_a);
s1=f-s;
s2=abs(s1);
image=(s1+s2)*0.5;%去背景后的图片 
a=5; b=5;%选取边界距离为5
[xi,yi]=find(image==max(max(image(a:m-a,b:n-b))));%最大值所在点的坐标
%最大值可能多个值，取第一个的坐标
xi=xi(1);
yi=yi(1);
%向四周搜索找出半径
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

