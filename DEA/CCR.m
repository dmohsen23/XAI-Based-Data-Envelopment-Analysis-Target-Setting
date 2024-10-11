clc;
clear;
close all;

%% Load Data

data = xlsread('IOCCR.xlsx', 'DEA Frontiers');

x = data(1:288, 2:4)';
y = data(1:288, 5:9)';

x1 = data(1:267, 13:15)';
y1 = data(1:267, 16:20)';

x2 = data(1:234, 24:26)';
y2 = data(1:234, 27:31)';

x3 = data(1:188, 35:37)';
y3 = data(1:188, 38:42)';

x4 = data(1:138, 46:48)';
y4 = data(1:138, 49:53)';

x5 = data(1:81, 57:59)';
y5 = data(1:81, 60:64)';
%% Variables

K = size(x,2);
E = zeros(K,1);
for k=1:K
    E(k) = GetSingleCCREfficiency(x, y, k);
end

K1 = size(x1,2);
E1 = zeros(K1,1);
for k1=1:K1
    E1(k1) = GetSingleCCREfficiency(x1, y1, k1);
end

K2 = size(x2,2);
E2 = zeros(K2,1);
for k2=1:K2
    E2(k2) = GetSingleCCREfficiency(x2, y2, k2);
end

K3 = size(x3,2);
E3 = zeros(K3,1);
for k3=1:K3
    E3(k3) = GetSingleCCREfficiency(x3, y3, k3);
end

K4 = size(x4,2);
E4 = zeros(K4,1);
for k4=1:K4
    E4(k4) = GetSingleCCREfficiency(x4, y4, k4);
end

K5 = size(x5,2);
E5 = zeros(K5,1);
for k5=1:K5
    E5(k5) = GetSingleCCREfficiency(x5, y5, k5);
end
%% Calc Efficiency for All DMUs

[eff, out] = GetSingleCCREfficiency(x, y, k);
[eff1, out1] = GetSingleCCREfficiency(x1, y1, k1);
[eff2, out2] = GetSingleCCREfficiency(x2, y2, k2);
[eff3, out3] = GetSingleCCREfficiency(x3, y3, k3);
[eff4, out4] = GetSingleCCREfficiency(x4, y4, k4);
[eff5, out5] = GetSingleCCREfficiency(x5, y5, k5);


Xbar=x(1,:)+x(2,:)+x(3,:);
Ybar=y(1,:)+y(2,:)+y(3,:)+y(4,:)+y(5,:);
% 
% Xbar1=x1(1,:)+x1(2,:)+x1(3,:);
% Ybar1=y1(1,:)+y1(2,:)+y1(3,:)+y1(4,:)+y1(5,:);

% Xbar2=x2(1,:)+x2(2,:)+x2(3,:);
% Ybar2=y2(1,:)+y2(2,:)+y2(3,:)+y2(4,:)+y2(5,:);
% 
% Xbar3=x3(1,:)+x3(2,:)+x3(3,:);
% Ybar3=y3(1,:)+y3(2,:)+y3(3,:)+y3(4,:)+y3(5,:);
% 
% Xbar4=x4(1,:)+x4(2,:)+x4(3,:);
% Ybar4=y4(1,:)+y4(2,:)+y4(3,:)+y4(4,:)+y4(5,:);
% 
% Xbar5=x5(1,:)+x5(2,:)+x5(3,:);
% Ybar5=y5(1,:)+y5(2,:)+y5(3,:)+y5(4,:)+y5(5,:);

Emin = min(E,[],2);
Emax = max(E,[],2);

Ebar=find(E==1);
Ebar1=find(E1==1);
Ebar2=find(E2==1);
Ebar3=find(E3==1);
Ebar4=find(E4==1);
Ebar5=find(E5==1);

%% Plot Results

plot(Xbar,Ybar, 'o');
hold on
scatter(Xbar(E==1), Ybar(E==1), 'h', 'MarkerFaceColor',[0.6350 0.0780 0.1840], 'MarkerEdgeColor',[0.6350 0.0780 0.1840], 'LineWidth', 1.5)
% hold on
% scatter(Xbar1(E1==1), Ybar1(E1==1), 'fill', 'MarkerFaceColor',[0 0.4470 0.7410], 'MarkerEdgeColor',[0 0.4470 0.7410])
% hold on
% scatter(Xbar2(E2==1), Ybar2(E2==1), 'MarkerEdgeColor',[0.6350 0.0780 0.1840],'MarkerFaceColor',[0.6350 0.0780 0.1840])
% hold on
% scatter(Xbar(E3==1), Ybar(E3==1), 'bo')
% hold on
% scatter(Xbar(E4==1), Ybar(E4==1), 'h', 'MarkerFaceColor',[0.8500 0.3250 0.0980], 'MarkerEdgeColor',[0.8500 0.3250 0.0980], 'LineWidth', 1.5)
% hold on
% scatter(Xbar(E5==1), Ybar(E5==1), 'fill', 'MarkerFaceColor',[0 0.4470 0.7410], 'MarkerEdgeColor',[0 0.4470 0.7410])
% grid on
% legend({'Efficiency Frontier 4', 'Efficiency Frontier 5'}, 'location', 'southeast');
% xlabel('Inputs', 'fontsize', 12, 'fontweight', 'bold')
% ylabel('Outputs', 'fontsize', 12, 'fontweight', 'bold')

% figure;
% bar(E);
% legend('CCR');

% xlabel('X', 'fontsize', 16, 'fontweight', 'bold')
% ylabel('Y', 'fontsize', 16, 'fontweight', 'bold')
% set(gca, 'box' , 'on', 'linewidth', 1, 'fontsize', 16, 'fontweight', 'bold')