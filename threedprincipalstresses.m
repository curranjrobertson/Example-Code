function [sigma] = threedprincipalstresses(x, y, z, x_y, y_z, z_x)
syms stress

I1 = x + y + z;
I2 = x*y + y*z + z*x - x_y^2 -y_z^2 - z_x^2;
I3 = x*y*z + 2*x_y*y_z*z_x - x*y_z^2 - y*z_x^2 - z*x_y^2;

eqn = stress^3 - I1*stress^2 + I2*stress - I3 == 0;

solve(eqn, stress);
sigma = double(ans);
end
