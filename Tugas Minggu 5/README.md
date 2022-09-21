%Kd diubah ke 1,3,5,7,9
T = 1
Kp = 1;
Kd = 1;
s = tf('s')
 
num = 1;
den = [T T/10 1];
 
num_ct = [Kd Kp]
 
sys = tf(num, den);
sys_ct = tf(num_ct, [1]);
sys_cl = feedback(sys_ct*sys, 1);
 
step(sys_cl)
step(sys_cl/s)
impulse(sys_cl)
stepinfo(sys_cl)
xlim([0 30])

Program diawali dengan mendeklarasikan variable dan nilainya. T diset ke 1 dan d diberikan nilai 1,3,5,7,9.

System dikalikan dengan sistem P dan D dan difeedbackan dengan feedback(sys_ct*sys, 1);

Kemudian setiap variasi D akan dilihat grafik Step Ramp Impulse beserta nilai Rise time, settling time, overshoot dan steady state error.

