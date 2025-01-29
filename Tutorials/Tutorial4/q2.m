%% Transfer function
s = tf('s');
P = 1/(s*(s+2));

%% Root locus
rlocus(P);