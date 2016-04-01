function [imagem,imagemid] = find_maxpoitera( f )
fb=removeb_newdate(f);
%寻找最大值所在的区域
E_a=mean(f(:));%期望
D_a=std2(f);%均方差
%*******去背景********
[M,N]=size(f);
s=ones(M,N)*(E_a+3*D_a);
s1=f-s;
s2=abs(s1);
image=(s1+s2)*0.5;%去背景后的图片
%找出最大亮度的区域
%区域大小选为256*256
[xi,yi]=find(image==max(max(image)));%最大值所在点的坐标
A1=xi-128;
B1=xi+127;
C1=yi-128;
D1=yi+127;
while A1<1
    A1=1;
    B1=256;
end
while B1>M
    B1=M;
    A1=M-255;
end
while C1<1
    C1=1;
    D1=256;
end
while D1>N
    D1=N;
    C1=N-255;
end
imagem=f(A1:B1,C1:D1);%最大值选取的区域
imagemb=fb(A1:B1,C1:D1);
%imshow(imagemb)
%***选取非最大值所在的区域**
imagemid=imagem;
    A2=floor((M-256)*rand(1))+1;
    B2=A2+255;
    C2=floor((N-256)*rand(1))+1;
    D2=C2+255;
while  ((B2>A1)&(B1>A2))        %不与imagem重合
    A2=floor((M-256)*rand(1))+1;
    B2=A2+255;
    C2=floor((N-256)*rand(1))+1;
    D2=C2+255;
    imagemid=f(A2:B2,C2:D2);
end
 imagemid=f(A2:B2,C2:D2);
imagemidb=fb(A2:B2,C2:D2);
%imshow(imagemidb)
end

