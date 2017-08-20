s = [100:50:600];
%r = [5:1:60]*1e3;
r = [30:1:160];

Ts = 1;
[speed,request]=meshgrid(s,r);
sim('dyno');

power = speed.*torque;
bsfc = -energy./power;
[c,h]=contour(speed,torque,bsfc);
%[c,h]=contour(speed,power,1./bsfc);
clabel(c,h);
