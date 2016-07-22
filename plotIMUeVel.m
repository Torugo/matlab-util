clear all; close all; clc;

global orientation;
global angular_velocity;
global linear_acceleration;

global vel_linear;
global vel_angular;
vel_angular = [0 0 0];

global odomPos
odomPos = [0 0 0];

imuSubs = rossubscriber('/imu',@parseImuData);%subscriber for IMU
velSubs = rossubscriber ('/adrt1_velocity_controller/cmd_vel', @parseVelData);
odomSubs = rossubscriber ('/odometry/filtered', @parseEkfOdomData);


pause(1);
A = angular_velocity(3);
B = vel_angular(3);
X = odomPos(1);
Y = odomPos(2);

counter_1 = 1;
counter_2 = 1;
x_width = 100;


subplot(1,2,1)
title('Yaw Velocity IMU(blue) x Yaw Velocity(red)');
xlabel('Time');ylabel('rad/s');
grid;
hold on;
subplot(1,2,2)
title('X x Y Pos');
xlabel('X');ylabel('Y');
grid;
hold on;


while 1
    pause(0.25);
    subplot(1,2,1)
    %print('yaw = ');
    %A
    %print('yaw velo;city command = ')
    %B
    if (size(A) <= (x_width)) % in the beginning A is newly build up
        A = [A;angular_velocity(3)]; % fill new line of A with data from pos
        B = [B;vel_angular(3)]; % orient not pos
        time = [1:counter_1]';
        plot(time ,A(1:counter_1,1), 'b',time ,B(1:counter_1,1), 'r'); % plot x achsis  
        %plot([1:counter_1]',B(1:counter_1,1), 'Color',[1,0,0]);
    else % A is expanded and first element erased
        A = [A(2:size(A),:);angular_velocity(3)]; % fill new line of A with data from pos
        B = [B(2:size(B),:);vel_angular(3)];
        xlim([(counter_1 - x_width),counter_1]);
        time = [(counter_1 - x_width + 1):counter_1 + 1]';
        plot(time,A(:,1), 'b', time, B(:,1),'r');
        %plot([(counter_1 - x_width + 1):counter_1 + 1]',B(:,1), 'Color',[1,0,0]);
    end
    counter_1 = counter_1 + 1; % number of steps gone
    
    subplot(1,2,2)
     X = [X;odomPos(1)];
     Y = [Y;odomPos(2)];
     scatter(Y,X, 'x')
    
    
    
end