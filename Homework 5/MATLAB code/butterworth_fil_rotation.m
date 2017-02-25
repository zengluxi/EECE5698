for i= 1:1:1359
    n = (i-1)*14;
    time(i) = (rot_imu(n+2,2))/(10^6);
    gyro_z(i) = rot_imu(n+14,2);
    yaw(i) = (rot_imu(n+3,2))*pi/180;
end
% 
for i = 1:1:1359
    new_time(i) = time(i)-time(1);
end

% do the 1-pole butterworth lowpass filter
freq = 40; 
cutoff_freq = 10; 
[b,c] = butter(1,cutoff_freq/(freq/2));
butter_yaw = filter(b, c, gyro_z);

butter_yaw_calc = cumtrapz(new_time,butter_yaw);
butter_yaw_calc = mod(butter_yaw_calc,2*pi) - pi;
figure(1);
subplot(2,1,1)
plot(yaw,'b')
hold on
plot(butter_yaw_calc,'r')
legend('original yaw','estimate yaw')
xlabel('Time(s)')
ylabel('Yaw(rad)')
grid on
title('Butterworth filter yaw angle analysis')
hold off