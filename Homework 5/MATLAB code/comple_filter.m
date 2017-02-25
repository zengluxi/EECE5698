freq = 40;
dt = 1/freq;
for i= 1:1:1359
    n = (i-1)*14;
    time(i) = (rot_imu(n+2,2))/(10^6);
    yaw_org(i) = rot_imu(n+3,2);
    % transform from degree to radian, for easier comparison
    yaw_org(i) = yaw_org(i)*pi/180; 
    angle(i) = atan2(-mag_y(i),mag_x(i));
    gyro_z(i) = rot_imu(n+14,2);
end
for i = 1:1:1359
    new_time(i) = time(i)-time(1);
end
dt(1) = 0;
for i = 2:1:1359
    dt(i) = new_time(i) - new_time(i-1);
end
yaw_calc(1) = yaw_org(1);
for i= 2:1:1359
     yaw_calc(i) = 0.98*(yaw_org(i-1)+gyro_z(i)*dt(i)) + 0.02*angle(i);
end
figure(1);
plot(yaw_calc)
hold on
plot(yaw_org)
title('Complementary filter yaw angle analysis')
xlabel('time(s)')
ylabel('yaw angle(rad)')
legend('original yaw','estimate yaw')
grid on
hold off