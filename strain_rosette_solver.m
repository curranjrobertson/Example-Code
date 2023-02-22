function [strain_x, strain_y, shear_xy] = strain_rosette_solver(strain_a, strain_b, strain_c, theta_a, theta_b, theta_c)
% Curran Robertson
%
% Takes angles and strain readings from 3 strain rosettes and outputs
% given state of strain in micro-strains wrt axes.
% Give angles in degrees and strain in micro-strains

sympref('FloatingPointOutput', true);
syms strain_x strain_y shear_xy


eqn1 = strain_a == strain_x * cosd(theta_a)^2 + strain_y * sind(theta_a)^2 + shear_xy * sind(theta_a) * cosd(theta_a);
eqn2 = strain_b == strain_x * cosd(theta_b)^2 + strain_y * sind(theta_b)^2 + shear_xy * sind(theta_b) * cosd(theta_b);
eqn3 = strain_c == strain_x * cosd(theta_c)^2 + strain_y * sind(theta_c)^2 + shear_xy * sind(theta_c) * cosd(theta_c);

[strain_x, strain_y, shear_xy] = solve([eqn1 eqn2 eqn3], [strain_x strain_y shear_xy]);


end
