function [normal_xp, normal_yp, shear_xpyp] = strain_transformation(normal_x, normal_y, shear_xy, theta)
% This function transforms 2d strain element by an angle of theta CC. Input
% theta in degrees.
normal_xp = (normal_x+normal_y)/2 + ((normal_x - normal_y)/2)*cosd(2*theta) + (shear_xy/2)*sind(2*theta);
normal_yp = (normal_x+normal_y)/2 - ((normal_x-normal_y)/2)*cosd(2*theta) - (shear_xy/2)*sind(2*theta);
shear_xpyp = -(normal_x - normal_y)*sind(2*theta) + shear_xy*cosd(2*theta);

end