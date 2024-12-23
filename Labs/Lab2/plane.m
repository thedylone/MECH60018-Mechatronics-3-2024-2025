%% Transfer function
s = tf('s');
num = [1.151 0.1774];
den = [1 0.739 0.921 0];
P_pitch = tf(num,den)

%% Open-loop response
t = 0:0.01:10;
step(0.2*P_pitch,t);
axis([0 10 0 0.8]);
ylabel('pitch angle (rad)');
title('Open-loop Step Response');
saveas(gcf, 'figures/1-open.fig');
saveas(gcf, 'plots/1-open.jpg');
stepinfo(0.2*P_pitch)

%% Open-loop poles/zeros
pole(P_pitch)
zero(P_pitch)
pzmap(P_pitch);
