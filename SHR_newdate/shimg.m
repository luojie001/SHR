function [ shim ] = shimg( orgimg,BWL1filter,BWL2filter,BWL3filter )
%Calculate the sharpness of the image :: We use the method that used and
%tested in the script sharpnesseffetfrequencytest script

%The low energy part
BWL1owenerg=sum(sum(abs((ifft2(orgimg.*BWL1filter)))));

%The high energy part
BWL2owenerg = sum(sum(abs(ifft2(orgimg.*BWL2filter))));
BWL3owenerg = sum(sum(abs(ifft2(orgimg.*BWL3filter))));
%The ratio of high energy ratio to the low energy ratio
shim = (BWL2owenerg-BWL1owenerg)/(BWL3owenerg -(BWL2owenerg-BWL1owenerg));


end

