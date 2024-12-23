%% Transfer function
s = tf('s');
num = [1.151 0.1774];
den = [1 0.739 0.921 0];
P_pitch = tf(num,den)

%% Bode plot
margin(P_pitch), grid
saveas(gcf, 'figures/9-bode.fig');
saveas(gcf, 'plots/9-bode.jpg');

%% Closed-loop response
sys_cl = feedback(P_pitch,1)
step(0.2*sys_cl), grid
ylabel('pitch angle (rad)');
title('Closed-loop Step Response')

%% Lead compensator
K = 10;
margin(K*P_pitch), grid
saveas(gcf, 'figures/10-bode-K-10.fig');
saveas(gcf, 'plots/10-bode-K-10.jpg');
sys_cl = feedback(K*P_pitch,1);
step(0.2*sys_cl), grid
title('Closed-loop Step Response with K = 10')
saveas(gcf, 'figures/11-closed-step-K-10.fig');
saveas(gcf, 'plots/11-closed-step-K-10.jpg');

%% 
K = 10;
alpha = 0.10;
T = 0.52;
C_lead = K*(T*s + 1) / (alpha*T*s + 1);
margin(C_lead*P_pitch), grid
saveas(gcf, 'figures/12-bode-lead.fig');
saveas(gcf, 'plots/12-bode-lead.jpg');

sys_cl = feedback(C_lead*P_pitch,1);
step(0.2*sys_cl), grid
title('Closed-loop Step Response with K = 10, \alpha = 0.10, and T = 0.52')
saveas(gcf, 'figures/13-closed-step-lead.fig');
saveas(gcf, 'plots/13-closed-step-lead.jpg');

stepinfo(0.2*sys_cl)

%% Modify the lead compensator
alpha = 0.04;
T = 0.55;
C_lead = K*(T*s + 1) / (alpha*T*s + 1);
sys_cl = feedback(C_lead*P_pitch,1);
step(0.2*sys_cl), grid
title('Closed-loop Step Response with K = 10, \alpha = 0.04, and T = 0.55')
saveas(gcf, 'figures/14-closed-step-lead-modified.fig');
saveas(gcf, 'plots/14-closed-step-lead-modified.jpg');

stepinfo(0.2*sys_cl)