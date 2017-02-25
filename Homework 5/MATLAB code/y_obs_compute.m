for i= 1:1:8000
    n1 = (i-1)*14;
    time1(i) = (driv_imu(n1+2,2))/(10^6);
    gyro_z1(i) = driv_imu(n1+14,2);
    acc_x1(i) = driv_imu(n1+9,2);
    acc_y1(i) = driv_imu(n1+10,2);
end
for i = 1:1:8000
    new_time1(i) = time1(i)-time1(1);
end
% Since there are some outliar value in gyro_z, need to filter them out
index_1 = find(abs(gyro_z1)>0.2);
gyro_z1(index_1) = 0;
% Use the butterworth lowpass filter to do further filter
[b,c] = butter(1,15/1500,'low');
butter_yaw1 = filter(b, c, gyro_z1);

y_calc = cumtrapz(new_time1,acc_x1);

y_calc = butter_yaw1.*y_calc;

figure(1);
plot(butter_yaw1)
xlabel('w value')
ylabel('time(s)')
title('Filtered w value')
figure(2);
plot(y_calc(1:8000),'r')
hold on
plot(acc_y1(1:8000),'b')
legend('calculate value','original value')
xlabel('time(s)')
ylabel('Acclerometer value')
title('Yobs vs. wX')