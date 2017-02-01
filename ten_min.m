% After importing data directly from txt file, data are strored double
% under variable 'tenmin'

% Initialzie value
sum_x = 0;
sum_y = 0;
sum_dev_x = 0;
sum_dev_y = 0;
data_size = size(tenmin,1);

% The first couple data might be unstable
for i = 9:2:(data_size-1)
    figure(1);
    plot(tenmin(i,2),tenmin(i+1,2),'b*');
    hold on
end
title('Plot of utm_x vs utm_y');
xlabel('utm_x');
ylabel('utm_y');
grid on
hold on;

% Calculate the mean value and plot it out
for i = 1:2:(data_size-1)
    sum_x = sum_x + tenmin(i,2);
    sum_y = sum_y + tenmin(i+1,2);
end
mean_utm_x = sum_x/(data_size/2);
mean_utm_y = sum_y/(data_size/2);
plot(mean_utm_x,mean_utm_y,'r+');

% Calculate standard deviation, used for later calculation
for i = 1:2:(data_size-1)
    sum_dev_x = sum_dev_x + (tenmin(i,2)-mean_utm_x)^2;
    sum_dev_y = sum_dev_y + (tenmin(i+1,2)-mean_utm_y)^2;
end
dev_utm_x = sqrt(sum_dev_x/(data_size/2));
dev_utm_y = sqrt(sum_dev_y/(data_size/2));

% Plot CEP
r = 0.62*dev_utm_y + 0.56*dev_utm_y;
x = tenmin((data_size/2-1),2);
y = tenmin(data_size/2,2);

rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1]),axis equal