function [strain_x,strain_y,strain_z,shear_xy,shear_yz,shear_zx] = Gen_hookes_law(stress_x,stress_y,stress_z,tau_xy,tau_yz,tau_zx,nu,E)
% This function solves for strain values given a 3d stress state. Enter
% stress_x (normal),stress_y,stress_z,tau_xy (shear),tau_yz,tau_zx,nu (poisson's ratio), and E
% (Young's Modulus).
format long
strain_x = (1/E)*(stress_x - nu*(stress_y + stress_z));
strain_y = (1/E)*(stress_y - nu*(stress_x + stress_z));
strain_z = (1/E)*(stress_z - nu*(stress_x + stress_y));

G = E/(2*(1+nu));

shear_xy = (1/G)*tau_xy;
shear_yz = (1/G)*tau_yz;
shear_zx = (1/G)*tau_zx;

end
