%% Transfer function
s = tf('s');
P = 1/(s+3);

%% Root locus
rlocus(P);

%% Settling time
Ts = 0.2;
a = log(0.02)/Ts;
K = -a - 3
xline(a, '--',"T_s = 4");
axis([-20 0 -5 5])

%% Poles
T = feedback(P, K);
pzmap(P, T)