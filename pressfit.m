function [P] = pressfit(delta,r_i,E_i,v_i,R,r_o,E_o,v_o)

% This function returns pressure of a pressfit with the inputs of inner
% radius, young's modulus inner,poissons ratio inner,nominal radius, outer
% radius, young's modulus outer,poissons ratio outer.

P = delta/(R*((1/E_o)*((r_o^2+R^2)/(r_o^2-R)+v_o)+(1/E_i)*((R^2+r_i^2)/(R^2-r_i^2)-v_i)));

end