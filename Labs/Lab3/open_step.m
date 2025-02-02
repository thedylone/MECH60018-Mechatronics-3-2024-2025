%% Motor Parameters
b = 0.2;
J = 0.1;
K = 0.02;
L = 0.4;
R = 2;

%% Transfer function
u = 1;
[num,den] = linmod('DCMotor');
P=tf(num,den);

%% Open-loop step response
figure(1);
step(u*P);
saveas(gcf, 'figures/1-open.fig');
saveas(gcf, 'plots/1-open.jpg');
stepinfo(u*P)

figure(2);
bode(P);
saveas(gcf, 'figures/2-bode.fig');
saveas(gcf, 'plots/2-bode.jpg');
