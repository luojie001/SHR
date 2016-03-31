function [image] = removeb(image)
[m,n]=size(image);
E_a=mean(image(:));%期望
D_a=std2(image);%均方差
s=ones(m,n)*(E_a+D_a);
s1=image-s;
s2=abs(s1);
image=(s1+s2)*0.5;
end

