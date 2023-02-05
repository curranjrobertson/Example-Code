function [sigma_t, sigma_r, sigma_l, tau_max] = pvessnormstress(p_i,po,ri,ro,r)
% Curran Robertson
% Pressure Vessel Solver
% Finds normal stress in tangential and radial directions in a pressure 
% vessel. Enter internal pressure, external pressure, inner radius, outer
% radius, and radius of stress. Max stress is at ri when po = 0.

sigma_t = (p_i*ri^2-po*ro^2-ri^2*ro^2*(po-p_i)/r^2)/(ro^2-ri^2);
sigma_r = (p_i*ri^2-po*ro^2+ri^2*ro^2*(po-p_i)/r^2)/(ro^2-ri^2);
sigma_l = p_i*ri^2/(ro^2-ri^2);
tau_max = 1/2*(sigma_t - sigma_r);

end