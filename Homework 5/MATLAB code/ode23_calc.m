for i= 1:1:1359
    n = (i-1)*14;
    time(i) = (rot_imu(n+2,2))/(10^6);
    gyro_z(i) = rot_imu(n+14,2);
    yaw(i) = (rot_imu(n+3,2))*pi/180;
end

for i = 1:1:1359
    new_time(i) = time(i)-time(1);
end
dt(1) = 0;

for i = 2:1:1359
    dt(i) = new_time(i) - new_time(i-1);
end
yaw_calc(1) = 0;
for i = 1:1:1358
    tspan = [0 dt(i+1)];
    [t,y] = ode23(@(t,y)gyro_z(i),tspan, yaw_calc(i));
    yaw_calc(i+1)= y(length(y));
end

yaw_calc = mod(yaw_calc,2*pi) - pi;

figure(1);
subplot(2,1,2)
plot(yaw,'b')
hold on
plot(yaw_calc,'r')
legend('original yaw','estimate yaw')
xlabel('Time(s)')
ylabel('Yaw(rad)')
grid on
title('ode23.m yaw angle analysis')
hold off