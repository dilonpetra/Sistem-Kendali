L. Odilon Petra I.
Tugas minggu 3

Link Github: https://github.com/dilonpetra/Sistem-Kendali.git 

	mendeklarasikan variable dalam integral effect control yaitu T, sys, Kp, Ki, s.

s = tf('s')
T = 1;
 
num = 1;
den = [T T/16 1];
 
Kp = 1;
Ti = 1;
Ki = Kp/Ti;
 
sys = tf(num, den);

	mendeklarasikan variable dalam integral effect control yaitu T, sys, Kp, Ki, s.

sys_c = tf([Kp, Ki], [1, 0]);

	menghitung fungsi = feedback(sys*sys_c,1)

fungsi = feedback (sys*sys_c, 1
 
	 menghitung respon impulse, step dan ram

figure
subplot(311), step(fungsi*s);   % Impulse reponse
stepinfo(fungsi*s)
subplot(312), step(fungsi);      % Step Response
stepinfo(fungsi)
subplot(313), step(fungsi / s);  % Ramp response 
stepinfo(fungsi/s)

mendeklarasikan variable dalam integral effect control yaitu T, sys, Kp, Ki, s.
menghitung fungsi gain = (Kps + Ki)/s
menghitung fungsi = feedback(sys*sys_c,1)
menghitung respon impulse, step dan ram


