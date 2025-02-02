%% Motor Parameters
b = 0.2;
J = 0.1;
K = 0.02;
L = 0.4;
R = 2;

%% Transfer function
u = 1;
[num,den] = linmod('DCMotor1a');
P=tf(num,den);

%% Low-pass filter open-loop step response
figure(1);
step(u*P);
stepinfo(u*P)

figure(2);
bode(P);

%%
margin(P), grid