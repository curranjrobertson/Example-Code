function [xf] = newtonraphson(f,df,xi)
% Newton-Raphson Function
% Author: Curran Robertson

lim = 0.0001; % error limit
err = 1; % init error
while err > lim
  xp = xi;
  xi = xp -f(xp)/df(xp);
  err = abs(xp-xi);
end
xf = xi;
