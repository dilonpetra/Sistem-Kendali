close all; clear all; clc;

J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

s = tf('s');
sys = K/((J*s+b)*(L*s+R)+K^2)

% initial value
KP = 0.1;
KI = 0;
KD = 0;

cont = pid(KP, KI, KD);
final = feedback(cont*sys, 1);
info = stepinfo(final);

figure
step(final);

fitness = 1000;

% griid search parameter
max_kp = 3;
max_ki = 3;
max_kd = 3;
increament = 0.1;
weight_risetime = 0.6;
weight_overshoot = 0.3;
weight_settlingtime = 0.1;

% for kp = KP : increament : max_kp
%     for ki = KI : increament : max_ki
%         for kd = KD : increament : max_kd
%             cont = pid(kp, ki, kd);
%             final = feedback(cont*sys, 1);
%             info = stepinfo(final);
%             
%             % calculate fitness function
%             fitness_new = weight_risetime*info.RiseTime + weight_overshoot*info.Overshoot + weight_settlingtime*info.SettlingTime;
%             
%             fprintf('kp:%.1f ki:%.1f kd:%.1f rise:%.2f ovs:%.2f set:%.2f fitness:%f\n', kp, ki, kd, info.RiseTime, info.Overshoot, info.SettlingTime, fitness);
%             
%             % determine is new fitness is better than before
%             if fitness > fitness_new
%                 fitness = fitness_new;
%                 KP = kp;
%                 KI = ki;
%                 KD = kd;
%             end
%         end
%     end
% end

cont = pid(KP, KI, KD);
final = feedback(cont*sys, 1);

g= pidtune(final,'PID')
figure
step(final);
stepinfo(final);