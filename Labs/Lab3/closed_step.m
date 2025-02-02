%% Motor Parameters
b = 0.2;
J = 0.1;
K = 0.02;
L = 0.4;
R = 2;

%% Transfer function
u = 1;
[num,den] = linmod('DCMotor1b');
P=tf(num,den);
zpk(P)

%% PID Controller
Kp = 100;
Ki = 150;
Kd = 10;
C = pid(Kp,Ki,Kd);
T = feedback(C*P,1);
step(T);
saveas(gcf, 'figures/7-pid-step.fig');
saveas(gcf, 'plots/7-pid-step.jpg');
stepinfo(T)