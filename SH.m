function [SH] = SH(f)
%��������d0Ϊ0.1���Ǹ��ݾ��鷨�ó�
[m,n]=size(f);
BWLfilter=lpfilter('btw',m,n,0.1,2);
BWHfilter=hpfilter('btw',m,n,0.1,2);
SH=shimg(f,BWHfilter,BWLfilter )^1;
end

