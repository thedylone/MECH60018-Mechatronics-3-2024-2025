%% Transfer function
s = tf('s');
num = [1.151 0.1774];
den = [1 0.739 0.921 0];
P_pitch = tf(num,den)

%% Lead compensation
C = 300 * (s + 0.9)/(s + 30);
T = feedback(C*P_pitch, 1);

rlocus(T)

%%
t = 0:0.01:2;
step(0.2*T,t)
saveas(gcf, 'figures/8-closed-step-lead.fig');
saveas(gcf, 'plots/8-closed-step-lead.jpg');
