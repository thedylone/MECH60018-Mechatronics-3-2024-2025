%% Parameters for the car model
m = 1000;  % vehicle mass (kg)
b = 50;  % damping coefficient (N.s/m)
r = 10;  % reference speed (m/s)

%% Transfer function
s = tf('s');
P_cruise = 1/(m*s + b);

%% PID Control
Kp = 1;
Ki = 1;
Kd = 1;
C = pid(Kp,Ki,Kd);
T = feedback(C*P_cruise,1);

t = 0:1:200;
step(r*T,t)
axis([0 200 0 11])
title('Closed-loop Step Response, Kp = 1, Ki = 1, Kd = 1');
saveas(gcf, 'figures/10-closed-step-PID-1.fig');
saveas(gcf, 'plots/10-closed-step-PID-1.jpg');

%% PI poles/zeros
pole(T)
pzmap(T);
axis([-1 1 -1 1])

%% PI time parameters
stepinfo(T)
damp(T)