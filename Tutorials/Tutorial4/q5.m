%% Transfer function
s = tf('s');
P = 1/(s+10) * 1/(s*(s+5));

%% Root locus
rlocus(P);
sgrid(0.7,0);
axis([-15 5 -8 8])