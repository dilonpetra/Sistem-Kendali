
J = 5;
Kp = 1;
Kd = 1;

num = 1;
den = [J 0 0];

num_ct = [Kd Kp]

sys = tf(num, den);
sys_ct = tf(num_ct, [1]);
sys_cl = feedback(sys_ct*sys, 1);

step(sys_cl)
xlim([0 50])