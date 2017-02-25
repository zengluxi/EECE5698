for i = 1:1:9982
    n1 = (i-1)*14;
    time_1(i) = (driv_imu(n1+2,2))/(10^6);
    gyro_z1(i) = driv_imu(n1+14,2);
    yaw_1(i) = (driv_imu(n1+3,2))/180*pi;
end

for i = 1:1:9982
    new_time_1(i) = time_1(i)-time_1(1);
end

% do the 1-pole butterworth lowpass filter
freq = 40; 
cutoff_freq = 10; 
[b,c] = butter(1,15/1000);
butter_yaw1 = filter(b, c, gyro_z1);

butter_yaw_calc1 = cumtrapz(new_time_1,butter_yaw1);
butter_yaw_calc1 = mod(butter_yaw_calc1,2*pi) - pi;
% set the calcualted begin value to 0
for i= 1:1:9982
    butter_yaw_calc1(i) = butter_yaw_calc1(i) - butter_yaw_calc1(1);
end
%butter_yaw_calc1 = butter_yaw_calc1 - 0.3;

for i=1:1:9982
    yaw_1(i) = yaw_1(i) - yaw(1);
end
figure(1);
plot(yaw_1(3068:9982))
hold on
plot(butter_yaw_calc1(3068:9982))
legend('original yaw','estimate yaw')
xlabel('Time(s)')
ylabel('Yaw(rad)')
grid on
title('Butterworth filter yaw angle analysis')
hold off