%% Transfer function
s = tf('s');
num = [1.151 0.1774];
den = [1 0.739 0.921 0];
P_pitch = tf(num,den)

%% Closed-loop response
sys_cl = feedback(P_pitch,1)
step(0.2*sys_cl);
ylabel('pitch angle (rad)');
title('Closed-loop Step Response');
saveas(gcf, 'figures/2-closed.fig');
saveas(gcf, 'plots/2-closed.jpg');
stepinfo(0.2*sys_cl)

%% Open-loop poles/zeros
pole(sys_cl)
zero(sys_cl)
pzmap(sys_cl);

%% Time domain
R = 0.2/s;
Y = sys_cl * R;
zpk(Y)
[r,p,k] = residue(Y.num{1},Y.den{1})

%% Symbolic inverse Laplace
syms z t
sympref('FloatingPointOutput',true)
[rnum,rden] = residue(r(1:2), p(1:2), k)
snum = poly2sym(rnum, z);
sden = poly2sym(rden, z);
C = ilaplace(snum/sden)

[rnum,rden] = residue(r(3), p(3), k)
snum = poly2sym(rnum, z);
sden = poly2sym(rden, z);
B = ilaplace(snum/sden)

[rnum,rden] = residue(r(4), p(4), k)
snum = poly2sym(rnum, z);
sden = poly2sym(rden, z);
A = ilaplace(snum/sden)

A+B+C

%% Plot symbolic inverse Laplace
fplot(A+B+C, [0, 70])
xlabel('time (sec)');
ylabel('pitch angle (rad)');
title('Closed-loop Step Response (y(t))');
saveas(gcf, 'figures/3-closed-yt.fig');
saveas(gcf, 'plots/3-closed-yt.jpg');
