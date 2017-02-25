lcm = [rot_imu;driv_imu];

for n= 1:1:11342
    i = (n-1)*14;
    yaw(n) = lcm(i+3);
    acc_x(n) = lcm(i+9);
    acc_y(n) = lcm(i+10);
    time(n) = lcm(i+2)/(10^6);
    gyro_z(n) = lcm(i+14);
end
figure(1);
plot(yaw);

wd = diff(gyro_z(3000:4001))/0.025;
vx = cumtrapz(time,acc_x);
 for i = 3334:1:3940
     xc(i-2999)=-gyro_z(i)*vx(i)/wd(i-2999);
 end
 c = sum(xc)/1000.0