%% Transfer function
Zo = [-2+3j -2-3j]';
Po = [0 -2 -5 -10]';
[b,a] = zp2tf(Zo,Po,1);

P = tf(b, a)

%% Root locus
rlocus(P)
axis([-12 2 -6 6])

%% Closed loop
K = 7.5;
T = feedback(P, K);
[p,z] = pzmap(T)
