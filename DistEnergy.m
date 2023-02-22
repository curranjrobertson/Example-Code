function [sigma_prime] = DistEnergy(sigma_x,sigma_y,sigma_z,tau_xy,tau_yz,tau_xz)
% Function uses distortion energy theory to find Von Mises Stress with input of 3d
% stress.
sigma_prime = (1/sqrt(2))*((sigma_x-sigma_y)^2+(sigma_y-sigma_z)^2+(sigma_z-sigma_x)^2+6*(tau_xy^2+tau_yz^2+tau_xz^2))^(1/2);

end