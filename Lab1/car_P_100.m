%% Parameters for the car model
m = 1000;  % vehicle mass (kg)
b = 50;  % damping coefficient (N.s/m)
r = 10;  % reference speed (m/s)

%% Transfer function
s = tf('s');
P_cruise = 1/(m*s + b);

%% Proportional control
Kp = 100;
C = pid(Kp);

T = feedback(C*P_cruise,1);

t = 0:0.1:20;
step(r*T,t)
axis([0 20 0 10])
title('Closed-loop Step Response with Proportional Control')
saveas(gcf, 'figures/3-closed-step-P-100.fig');
saveas(gcf, 'plots/3-closed-step-P-100.jpg');

%% Closed-loop poles/zeros
pole(T);
pzmap(T);
axis([-1 1 -1 1])

%% Closed-loop time parameters
stepinfo(T)
tau = m/(Kp + b)
err = 10*b/(b + Kp)