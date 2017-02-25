lcm = [rot_imu;driv_imu];
gps = [rot_gps;driv_gps];

for n=1:1:1152
    i = (n-1)*7;
    utm_x(n) = gps(i+6);
    utm_y(n) = gps(i+7);
end

for n= 1:1:11342
    i = (n-1)*14;
    yaw(n) = lcm(i+3);
    acc_x(n) = lcm(i+9);
    acc_y(n) = lcm(i+10);
    time(n) = lcm(i+2)/(10^6);
end

% for i = 1:1:11342
%     time(i) = time(i)-time(1);
% end

figure(1)
plot(utm_x,-utm_y,'.');
xlabel('gps utm x');
ylabel('gps utm y');
title('gps utm x and y');

[b,c] = butter(1,15/1500);
butter_yaw = filter(b, c, yaw);
figure(2);
plot(yaw,'b');
xlabel('time');
ylabel('yaw');
title('yaw angle');
hold on
plot(butter_yaw,'r')
legend('original yaw','butterworth filter yaw angle');

for i = 1:1:11342
    alpha(i) = butter_yaw(i)+theta;%beta;
    acc_N(i) = acc_x(i)*cos(alpha(i))+acc_y(i)*sin(alpha(i));
    acc_E(i) = acc_x(i)*sin(alpha(i))-acc_y(i)*cos(alpha(i));
end
    
rate_N = cumtrapz(time,acc_N);
rate_E = cumtrapz(time,acc_E);
    
x_N = cumtrapz(time,rate_N);
y_E = cumtrapz(time,rate_E);

figure(3)
plot(x_N,y_E,'b.');
xlabel('north');
ylabel('east');
title('vehicle xe and xn');