% There are in total 1360 groups of data, 
% we deleted one of them which is way out of the range. 
% Original Data
for i= 1:1:1359
    n = (i-1)*14;
    mag_x(i) = rot_imu(n+6);
    mag_y(i) = rot_imu(n+7);
end
figure(1);
subplot(2,2,1);
plot(mag_x,mag_y,'.')
xlabel('mag_x');
ylabel('mag_y');
title('Original data get from IMU');
grid on

% Hard iron effect correction
alpha = (max(mag_x)+min(mag_x))/2;
beta = (max(mag_y)+min(mag_y))/2;
for i = 1:1:1359
    mag_x(i) = mag_x(i)-alpha;
    mag_y(i) = mag_y(i)-beta;
end

subplot(2,2,2);
plot(mag_x,mag_y,'.')
xlabel('mag_x');
ylabel('mag_y');
title('Hard iron correction');
grid on

% Soft iron effect correction
for i = 1:1:1359
    radius(i) = sqrt(mag_x(i)^2 + mag_y(i)^2);
end

max_val = max(radius);
index_max = find(radius == max_val);
radius_max = sqrt(mag_x(index_max)^2 + mag_y(index_max)^2);
theta  = asin(mag_y(index_max)/radius_max);

for i = 1:1:1359
    mag_x(i) = cos(theta)*mag_x(i) + sin(theta)*mag_y(i);
    mag_y(i) = -sin(theta)*mag_x(i) + cos(theta)*mag_y(i);
end
Rx_max = max(mag_x);
Ry_max = min(mag_y);
scale = Ry_max/ Rx_max;
for i = 1:1:1359
    mag_x(i) = 2*mag_x(i)*scale;
    mag_y(i) = 2*mag_y(i);
end
subplot(2,2,3)
plot(mag_x, mag_y,'.')
xlabel('mag_x');
ylabel('mag_y');
title('Soft iron correction');
grid on