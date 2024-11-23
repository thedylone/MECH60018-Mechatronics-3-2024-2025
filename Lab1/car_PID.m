%% Parameters for the car model
m = 1000;  % vehicle mass (kg)
b = 50;  % damping coefficient (N.s/m)
r = 10;  % reference speed (m/s)

%% Transfer function
s = tf('s');
P_cruise = 1/(m*s + b);

%% PID Control
Kp = 500;
Ki = 50;
Kd = 50;
C = pid(Kp,Ki,Kd);
T = feedback(C*P_cruise,1);

t = 0:0.1:20;
step(r*T,t)
axis([0 20 0 11])
title('Closed-loop Step Response with PI Control')

%% PI poles/zeros
pole(T)
pzmap(T);
axis([-1 1 -1 1])

%% PI time parameters
stepinfo(T)
damp(T)