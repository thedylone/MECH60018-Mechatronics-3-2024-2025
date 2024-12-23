%% Transfer function
s = tf('s');
num = [1.151 0.1774];
den = [1 0.739 0.921 0];
P_pitch = tf(num,den)

%% P control
C = pid(1.1269);
T = feedback(C*P_pitch, 1);

t = 0:0.1:50;
step(0.2*T,t)
saveas(gcf, 'figures/4-closed-step-P.fig');
saveas(gcf, 'plots/4-closed-step-P.jpg');

%% PI control
C = pid(1.1268, 1.1268*0.02334)
T = feedback(C*P_pitch, 1);

t = 0:0.1:50;
step(0.2*T,t)
saveas(gcf, 'figures/5-closed-step-PI.fig');
saveas(gcf, 'plots/5-closed-step-PI.jpg');

%% PID control
C = pid(0.5241*2, 0.5241, 0.5241)
T = feedback(C*P_pitch, 1);

t = 0:0.1:50;
step(0.2*T,t)
saveas(gcf, 'figures/6-closed-step-PID.fig');
saveas(gcf, 'plots/6-closed-step-PID.jpg');

%% PID tuned
C = pid(1.74*(0.78+2.2), 1.74, 1.74*0.78*2.2);
T = feedback(C*P_pitch, 1);

t = 0:0.1:50;
step(0.2*T,t)