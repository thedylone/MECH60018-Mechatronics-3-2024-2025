%% Transfer function
s = tf('s');
P = (s+1)/(s*(s-1)*(s+6));

%% Root locus
rlocus(P);
axis([-8 2 -8 8])

%% Settling time
Ts = 4;
a = log(0.02)/Ts;
xline(a, '--',"T_s = 4");

