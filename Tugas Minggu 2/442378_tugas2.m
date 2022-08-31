s = tf('s');

T = 10;

n=1;
den=[T T/16 1];
G = tf(n,den);

figure(1)
impulse(G);

figure(2)
step(G); 

figure(3)
step(G/s); 
xlim([0 50]);


s1 = stepinfo(G);
disp(s1);
[y,t]=step(G);
sserror=(1-y(end));
