for i= 1:1:9982
    n1 = (i-1)*14;
    time1(i) = (driv_imu(n1+2,2))/(10^6);
    gyro_z1(i) = driv_imu(n1+14,2);
    yaw1(i) = (driv_imu(n1+3,2))*pi/180;
end

for i = 1:1:9982
    new_time1(i) = time1(i)-time1(1);
end
dt(1) = 0;

for i = 2:1:9982
    dt(i) = new_time1(i) - new_time1(i-1);
end

yaw_calc1(1) = 0;
for i = 1:1:9981
    tspan = [0 dt(i+1)];
    [t,y] = ode23(@(t,y)gyro_z1(i),tspan, yaw_calc1(i));
    yaw_calc1(i+1)= y(length(y));
end

yaw_calc1 = mod(yaw_calc1,2*pi) - pi;

for i= 1:1:9982
    yaw_calc1(i) = butter_yaw_calc1(i) - butter_yaw_calc1(1);
end
%butter_yaw_calc1 = butter_yaw_calc1 - 0.3;

figure(1);
%subplot(2,1,2)
plot(yaw1,'b')
hold on
plot(yaw_calc1,'r')
legend('original yaw','estimate yaw')
xlabel('Time(s)')
ylabel('Yaw(rad)')
grid on
title('ode23.m yaw angle analysis')
hold off