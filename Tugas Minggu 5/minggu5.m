T = 1
Kp = 1;
Kd = 9;
s = tf('s')

num = 1;
den = [T T/10 1];

num_ct = [Kd Kp]

sys = tf(num, den);
sys_ct = tf(num_ct, [1]);
sys_cl = feedback(sys_ct*sys, 1);

figure(1)
step(sys_cl)
xlim([0 20])
figure(2)
step(sys_cl/s)
xlim([0 20])
figure(3)
impulse(sys_cl)
xlim([0 20])
stepinfo(sys_cl)
