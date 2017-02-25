freq = 40;
dt = 1/freq;
for i= 1:1:9982
    n1 = (i-1)*14;
    time1(i) = (driv_imu(n1+2,2))/(10^6);
    yaw_org1(i) = (driv_imu(n1+3,2))/180*pi;
    % transform from degree to radian, for easier comparison
    angle1(i) = atan2(-mag_y1(i),mag_x1(i));
    gyro_z1(i) = driv_imu(n1+14,2);
end
for i = 1:1:9982
    new_time1(i) = time1(i)-time1(1);
end
dt(1) = 0;
for i = 2:1:9982
    dt(i) = new_time1(i) - new_time1(i-1);
end
yaw_calc1(1) = yaw_org1(1);
for i= 2:1:9982
     yaw_calc1(i) = 0.98*(yaw_org1(i-1)+gyro_z(i)*dt(i)) + 0.02*angle1(i);
end
yaw_calc1(2146) = 0;
yaw_calc1(9186) = 0;
yaw_calc1(8659) = 0;
yaw_calc1(8651) = 0;
% yaw_calc1(8650) = 0;
figure(1);
plot(yaw_calc1,'b')
hold on
plot(yaw_org1,'r')
title('Complementary filter yaw angle analysis')
xlabel('time(s)')
ylabel('yaw angle(rad)')
%legend('original yaw','estimate yaw')
grid on
hold off