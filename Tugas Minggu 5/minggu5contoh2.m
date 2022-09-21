J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

Kp = 75;
Kd = 10;

num = K;
den = [J*L (J*R+b*R) (b*R + K*K)];

num_ct = [Kd Kp]

sys = tf(num, den);
sys_ct = tf(num_ct, [1]);
sys_cl = feedback(sys_ct*sys, 1);

step(sys_cl)
   