function [ U,V] = dftuv( M,N )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
u=single(0:(M-1));
v=single(0:(N-1));
idx=find(u>M/2);
u(idx)=u(idx)-M;
idy=find(v>N/2);
v(idy)=v(idy)-N;
[U,V]=meshgrid(v,u);

end

