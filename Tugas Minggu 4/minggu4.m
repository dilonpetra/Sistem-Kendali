s = tf('s')
T = 1;

num = 1;
den = [T T/16 1];

Kp = 1;
Ti = 1;
Ki = Kp/Ti;

sys = tf(num, den);
sys_c = tf([Kp, Ki], [1, 0]);
fungsi = feedback(sys*sys_c, 1);

figure
subplot(311), step(fungsi*s);   % Impulse reponse
stepinfo(fungsi*s)
subplot(312), step(fungsi);      % Step Response
stepinfo(fungsi)
subplot(313), step(fungsi / s);  % Ramp response 
stepinfo(fungsi/s)