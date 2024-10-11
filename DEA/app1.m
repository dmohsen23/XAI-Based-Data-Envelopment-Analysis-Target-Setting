clc;
clear;
close all;

%% Load Data

% x = [ 20  19  25  27  22  55  33  31  30  50  53  38
%      151 131 160 168 158 255 235 206 244 268 306 284];
%  
% y = [100 150 160 180 94 230 220 152 190 250 260 250
%       90  50  55  72 66  90  88  80 100 100 147 120];

data = xlsread('IOCCR.xlsx', 'DEA Frontiers');

x = data(3:289, 2:4)';
y = data(3:289, 5:9)';

%% Calc CCR Efficiency for All DMUs
  
E = GetCCREfficiency(x, y);

%% Plot Results

P11 = y(1,:)./x(1,:);
P12 = y(1,:)./x(2,:);
P21 = y(2,:)./x(1,:);
P22 = y(2,:)./x(2,:);

figure;
subplot(1,2,1);
plot(P11(E<1),P12(E<1),'o');
hold on;
plot(P11(E==1),P12(E==1),'s');
xlabel('P_{11}');
ylabel('P_{12}');
grid on;

subplot(1,2,2);
plot(P21(E<1),P22(E<1),'o');
hold on;
plot(P21(E==1),P22(E==1),'s');
xlabel('P_{21}');
ylabel('P_{22}');
grid on;