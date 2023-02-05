function [sigma] = threeDprincipalstresses(x, y, z, xy, yz, zx)

I1 = x + y + z;
I2 = x*y + y*z + z*x - xy^2 -yz^2 - zx^2;
I3 = x*y*z + 2*xy*yz*zx - x*yz^2 - y*zx^2 - z*xy^2;

eqn = sigma^3 - I1*sigma^2 + I2*sigma - I3 == 0;

solve(eqn, sigma);
