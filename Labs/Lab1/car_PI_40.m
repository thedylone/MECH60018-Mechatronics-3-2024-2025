%% Parameters for the car model
m = 1000;  % vehicle mass (kg)
b = 50;  % damping coefficient (N.s/m)
r = 10;  % reference speed (m/s)

%% Transfer function
s = tf('s');
P_cruise = 1/(m*s + b);

%% PI Control
Kp = 800;
Ki = 40;
C = pid(Kp,Ki);
T = feedback(C*P_cruise,1);

t = 0:0.1:20;
step(r*T,t)
axis([0 20 0 10])
title('Closed-loop Step Response, Kp = 800, Ki = 40');
saveas(gcf, 'figures/9-closed-step-PI-40.fig');
saveas(gcf, 'plots/9-closed-step-PI-40.jpg');

%% PI poles/zeros
pole(T)
pzmap(T);
axis([-1 1 -1 1])

%% PI time parameters
stepinfo(T)
damp(T)