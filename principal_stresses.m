function [p1, p2, p_avg, tau_max, theta_p, theta_s] = principal_stresses(nx, ny, tau)
% Curran Robertson
% Principal Stress Solver 
% Finds principal stresses of a two dimensional element
p1 = (nx + ny)/2 + sqrt(((nx - ny)/2)^2 + tau^2);
p2 = (nx + ny)/2 - sqrt(((nx - ny)/2)^2 + tau^2);
p_avg = (p1 + p2) / 2;
tau_max = sqrt(((nx - ny)/2)^2 + tau^2);
theta_p = atand(tau/((nx-ny)/2))/2;
theta_s = atand((-(nx-ny)/2)/tau)/2;
end

