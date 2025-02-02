%% Chebyshev Type 1 filter design:
% wc -passband cut-off frequency (rad/s)
% Rc -attenuation at passband cut-off (dB) (Rc > 0)
% ws -stopband frequency (rad/s)
% Rs -attenuation at stopband (dB) (Rs > 0).
% Rp -peak-to-peak ripple in the passband (dB) (Rp > 0).
close all;clc;

wc=50;
Rc=3;
ws=70;
Rs=6;
Rp=3;

epsilon = sqrt(10^(Rc/10)-1);
lambda = sqrt(10^(Rs/10)-1);
N_Cb1 = ceil(acosh(lambda/epsilon)/acosh(ws/wc));
disp(N_Cb1);
[numC1,denC1] =cheby1(N_Cb1,Rp,wc,'s');
H1 = tf(numC1,denC1);
p_Cb1=pole(H1);
bode(H1); % Bode plot
disp(p_Cb1);

%% Transfer function
u = 1;
[num,den] = linmod('DCMotor1c');
P=tf(num,den);

%% Chebyshev Type 1 filter open-loop step response
figure(1);
step(u*P);
stepinfo(u*P)

figure(2);
bode(P);
saveas(gcf, 'figures/6-chebyshev-bode.fig');
saveas(gcf, 'plots/6-chebyshev-bode.jpg');

%%
margin(P), grid