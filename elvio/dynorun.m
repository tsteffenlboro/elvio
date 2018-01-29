s = [80:10:500];
%r = [5:1:60]*1e3;
r = [20:2:160];

Ts = 1;
[speed,torque]=meshgrid(s,r);
sim('dyno');

power = speed.*torque;
efficiency = -power./energy;
[c,h]=contour(speed,torque,efficiency);
%[c,h]=contour(speed,power,1./bsfc);
clabel(c,h);
xlabel('Speed in rad/s'); 
ylabel('Torque in Nm');
