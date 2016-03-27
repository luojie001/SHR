function [ shim ] = shimg( orgimg,BWHfilter,BWLfilter )
%Calculate the sharpness of the image :: We use the method that used and
%tested in the script sharpnesseffetfrequencytest script

%The low energy part
BWLowenerg=sum(sum(abs((ifft2(orgimg.*BWLfilter)))));

%The high energy part
BWHighenerg = sum(sum(abs(ifft2(orgimg.*BWHfilter))));

%The ratio of high energy ratio to the low energy ratio
shim = BWHighenerg/BWLowenerg;


end

