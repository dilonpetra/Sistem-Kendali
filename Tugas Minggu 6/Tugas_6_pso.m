close all; clear all; clc;

%% System
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

s = tf('s');
sys = K/((J*s+b)*(L*s+R)+K^2)

%% PSO parameters
N = 10;
max_iter = 40;

X = rand(3,N);
V = rand(3,N);

pbest = X;
pbest_obj = fitness_function(sys, X, N);
[~, idx_best] = min(pbest_obj);
gbest = pbest(:, idx_best);
gbest_obj = min(pbest_obj);

%% Initial control system
KP = gbest(1)
KI = gbest(2)
KD = gbest(3)

cont = pid(KP, KI, KD);
final = feedback(cont*sys, 1);

figure
step(final);
stepinfo(final)

%% PSO update
for iter = 1:max_iter
    r1 = rand(3);
    r2 = rand(3);
    
    w = 0.4 * iter/(max_iter^2) + 0.4;
    c1 = -3 * iter/max_iter + 3.5;
    c2 = 3 * iter/max_iter + 0.5;
     
    V = w*V + c1*r1*(pbest-X) + c2*r2*(gbest-X);
    X = X + V;
    
    obj = fitness_function(sys, X, N);
    pbest(:, (pbest_obj >= obj)) = X(:,(pbest_obj >= obj));
    pbest_obj = min(pbest_obj, obj);
    
    [~, idx_best] = min(pbest_obj);
    gbest = pbest(:, idx_best);
    gbest_obj = min(pbest_obj);
    
    fprintf('Best Global at Iteration %i : %.20f \n', iter, gbest_obj);
end

%% Final result
KP = gbest(1)
KI = gbest(2)
KD = gbest(3)

cont = pid(KP, KI, KD);
final = feedback(cont*sys, 1);

figure
step(final);
stepinfo(final)

%% Fitness function based on rise time, overshoot, and settling time
function f = fitness_function(sys, K, N)
    for i = 1:N
        c = pid(K(1,i), K(2,i), K(3,i));
        fb = feedback(c*sys, 1);
        si = stepinfo(fb);
        f(i) = si.RiseTime + si.Overshoot + si.SettlingTime;
    end
end