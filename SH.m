function [SH] = SH(f)
%这里设置d0为0.1，是根据经验法得出
[m,n]=size(f);
BWLfilter=lpfilter('btw',m,n,0.1,2);
BWHfilter=hpfilter('btw',m,n,0.1,2);
SH=shimg(f,BWHfilter,BWLfilter )^1;
end

