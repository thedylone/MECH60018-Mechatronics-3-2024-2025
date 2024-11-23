%% Parameters for the car model
m = 1000;  % vehicle mass (kg)
b = 50;  % damping coefficient (N.s/m)
u = 500;  % nominal control force (N)
r = 10;  % reference speed (m/s)

%% Transfer function
s = tf('s');
P_cruise = 1/(m*s + b);

%% Open-loop response
figure;
step(u*P_cruise);
title('Open-loop response');
saveas(gcf, 'figures/1-open.fig');
saveas(gcf, 'plots/1-open.jpg');
stepinfo(u*P_cruise)

%% Open-loop poles/zeros
pole(P_cruise);
pzmap(P_cruise);
axis([-1 1 -1 1])
saveas(gcf, 'figures/2-open-pzmap.fig');
saveas(gcf, 'plots/2-open-pzmap.jpg');
