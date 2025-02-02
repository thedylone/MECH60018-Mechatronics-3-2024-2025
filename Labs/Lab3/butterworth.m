%% Butterworth filter design:
% wc -passband cut-off frequency (rad/s)
% Rc -attenuation at passband cut-off (dB) (Rc > 0)
% ws -stopband frequency (rad/s)
% Rs -attenuation at stopband (dB) (Rs > 0)
wc=50;
Rc=3;
ws=70;
Rs=6;
epsilon = sqrt(10^(Rc/10)-1);
lambda = sqrt(10^(Rs/10)-1);
N_Bw = ceil(log(lambda/epsilon)/log(ws/wc));
disp(N_Bw);
[numB,denB] = butter(N_Bw,wc,'s');
H = tf(numB,denB);
p_Bw=pole(H);
bode(H); % Bode plot
disp(p_Bw);

%% Transfer function
u = 1;
[num,den] = linmod('DCMotor1b');
P=tf(num,den);

%% Butterworth filter open-loop step response
figure(1);
step(u*P);
stepinfo(u*P)

figure(2);
bode(P);
saveas(gcf, 'figures/5-butterworth-bode.fig');
saveas(gcf, 'plots/5-butterworth-bode.jpg');

%%
margin(P), grid