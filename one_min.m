data_size = size(onemin,1);

% The first couple data might be unstable
for i = 21:2:(data_size-9)
    figure(2);
    plot(onemin(i,1),onemin(i+1,1),'b*')
    hold on
end

title('Trajectory of GPS hits');
xlabel('utm_x');
ylabel('utm_y');