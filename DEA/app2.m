clc;
clear;
close all;

%% Load Data

% x = [ 20  19  25  27  22  55  33  31  30  50  53  38
%      151 131 160 168 158 255 235 206 244 268 306 284];
%  
% y = [100 150 160 180 94 230 220 152 190 250 260 250
%       90  50  55  72 66  90  88  80 100 100 147 120];
data = xlsread('IOCCR (Test).xlsx', 'DEA Frontiers');

% x = data(1:288, 2:4)';
% y = data(1:288, 5:9)';

% x = data(1:261, 13:15)';
% y = data(1:261, 16:20)';

% x = data(1:213, 24:26)';
% y = data(1:213, 27:31)';

% x = data(1:158, 35:37)';
% y = data(1:158, 38:42)';

x = data(1:100, 46:48)';
y = data(1:100, 49:53)';

% x = data(1:57, 57:59)';
% y = data(1:57, 60:65)';

%% Calc Efficiency for All DMUs
  
E1 = GetCCREfficiency(x, y);

% E2 = GetIOBCCEfficiency(x, y);

% E3 = GetOOBCCEfficiency(x, y);

% E4 = GetAdditiveEfficiency(x, y);

% E = [E1 E2 E3 E4];
E = E1;

Emin = min(E,[],2);
Emax = max(E,[],2);

find(E1==1);
%% Plot Results

figure;
bar(E);
legend('CCR');