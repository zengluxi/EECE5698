% Original Data
for i= 1:1:9983
    n1 = (i-1)*14;
    mag_x1(i) = driv_imu(n1+6,2);
    mag_y1(i) = driv_imu(n1+7,2);
end

% Hard iron effect correction
for i = 1:1:9983
    mag_x1(i) = mag_x1(i)-alpha;
    mag_y1(i) = mag_y1(i)-beta;
end

% Soft iron effect correction
for i = 1:1:9983
    radius1(i) = sqrt(mag_x1(i)^2 + mag_y1(i)^2);
end

for i = 1:1:9983
    mag_x1(i) = cos(theta1)*mag_x1(i) + sin(theta1)*mag_y1(i);
    mag_y1(i) = -sin(theta1)*mag_x1(i) + cos(theta1)*mag_y1(i);
end
for i = 1:1:9983
    mag_x1(i) = 2*mag_x1(i)*scale;
    mag_y1(i) = 2*mag_y1(i);
end