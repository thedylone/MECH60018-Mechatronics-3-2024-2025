%% Parameters for the car model
m = 1000;  % vehicle mass (kg)
b = 50;  % damping coefficient (N.s/m)
r = 10;  % reference speed (m/s)

%% Transfer function
s = tf('s');
P_cruise = 1/(m*s + b);

%% Proportional control
Kp = 5000;
C = pid(Kp);

T = feedback(C*P_cruise,1);

t = 0:0.1:20;
step(r*T,t)
axis([0 5 0 10])
title('Closed-loop Step Response, Kp = 5000')
saveas(gcf, 'figures/4-closed-step-P-5000.fig');
saveas(gcf, 'plots/4-closed-step-P-5000.jpg');

%% Closed-loop poles/zeros
pole(T);
pzmap(T);
axis([-10 1 -1 1])

%% Closed-loop time parameters
stepinfo(T)
tau = m/(Kp + b)
err = 10*b/(b + Kp)

%% Redefine to make u the output signal
T = feedback(C,P_cruise);
step(r*T,t)
title('Closed-loop Step Response of u, Kp = 5000')
saveas(gcf, 'figures/5-closed-step-P-5000-u.fig');
saveas(gcf, 'plots/5-closed-step-P-5000-u.jpg');

%% Try lower Kp to satisfy 500 N propulsion force limit
Kp = 50;
C = pid(Kp);
T = feedback(C,P_cruise);
t = 0:0.1:50;
step(r*T,t)
title('Closed-loop Step Response of u, Kp = 50')
saveas(gcf, 'figures/6-closed-step-P-50-u.fig');
saveas(gcf, 'plots/6-closed-step-P-50-u.jpg');

T = feedback(C*P_cruise,1);
step(r*T,t)
axis([0 50 0 10])
title('Closed-loop Step Response, Kp = 50')
saveas(gcf, 'figures/7-closed-step-P-50.fig');
saveas(gcf, 'plots/7-closed-step-P-50.jpg');

tau = m/(Kp + b)
err = 10*b/(b + Kp)

