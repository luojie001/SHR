function [SH] = SH(f)
%这里设置d0为0.1，是根据经验法得出
[M,N]=size(f);
R=findsize(f); 
d0=M/R;
BWL1filter=lpfilter('btw',M,N,d0,2);
BWL2filter=lpfilter('btw',M,N,M/3,2);
BWL3filter=lpfilter('btw',M,N,M,2);
H=1;
SH=10*shimg(f,BWL1filter,BWL2filter,BWL3filter )^H;
end

