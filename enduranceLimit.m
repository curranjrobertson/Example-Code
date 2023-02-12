function [Se] = enduranceLimit(Sut,a,b,Se_ideal,d,T_F,r,kt,kts)
% Enter Sut in MPa, T_F in Fahrenheit
ka = a*Sut^b;


prompt = 'Axial, Torsional, or Bending A/T/B : ';
stress = input(prompt,'s');

% Axial Stress
if stress == 'A'
    kb = 1;
    kc = 0.85;
    if Sut >= .050 && Sut <= .250
       sa = 0.246-3.08*(10^-3)*Sut+1.51*(10^-5)*Sut^2-2.67*(10^-8)*Sut^3; 
    elseif Sut >= 340 && Sut <= 1700
       sa = 1.24-2.25*(10^-3)*Sut+1.60*(10^-6)*Sut^2-4.11*(10^-10)*Sut^3;
    else 
        message = 'Sut not in range';
        disp(message)
    end
    
% Torsional Stress
elseif stress == 'T'
     if d < 0.3
        kb = 1;
        kc = 0.59;
     elseif d >= 0.3 && d <= 2
        kb = 0.879*d^(-0.107);
        kc = 0.59;
     elseif d > 2 && d <= 10
        kb = 0.91*d^(-0.157);
        kc = 0.59;
     elseif d >= 7.62 && d <= 51
        kb = 1.24*d^(-0.107);
        kc = 0.59;
     elseif d >= 51 && d <= 254
        kb = 1.51*d^(-0.157);
        kc = 0.59;
     else 
        message = 'Error: Invalid d';
        disp(message)
     end
     if Sut <= 0.050 && Sut <= 0.220
         sa = 0.190-2.51*(10^-3)*Sut+1.35*(10^-5)*Sut^2-2.67*(10^-8)*Sut^3;
     elseif Sut >=340 && Sut <= 1500
         sa = 0.958-1.83*(10^-3)*Sut+1.43*(10^-6)*Sut^2-4.11*(10^-10)*Sut^3;
     else 
        message = 'Sut not in range';
        disp(message)
     end
     
% Bending Stress
elseif stress == 'B'
     if d < 0.3
        kb = 1;
        kc = 1;
     elseif d >= 0.3 && d <= 2
        kb = 0.879*d^(-0.107);
        kc = 1;
     elseif d > 2 && d <= 10
        kb = 0.91*d^(-0.157);
        kc = 1;
     elseif d >= 7.62 && d <= 51
        kb = 1.24*d^(-0.107);
        kc = 1;
     elseif d >= 51 && d <= 254
        kb = 1.51*d^(-0.157);
        kc = 1;
     else 
        message = 'Error: Invalid d';
        disp(message)
     end
     if Sut >= .050 && Sut <= .250
       sa = 0.246-3.08*(10^-3)*Sut+1.51*(10^-5)*Sut^2-2.67*(10^-8)*Sut^3 ;
     elseif Sut >= 340 && Sut <= 1700
        sa = 1.24-2.25*(10^-3)*Sut+1.60*(10^-6)*Sut^2-4.11*(10^-10)*Sut^3;
     else 
        message = 'Sut not in range';
        disp(message)
     end
else
   message = 'Error, Invalid input';
   disp(message)
end

kd = 0.98 + 3.5*(10^-4)*T_F-6.3*(10^-7)*T_F^2;

%standard deviation
% sd = 0.08 
% x = ;
% mu_x = ;
% za = (x-mu_x)/sd);
% ke = 1 - 0.08*za;
kf = 1 + (kt-1)/(1+sa/sqrt(r));
kfs = 1 + (kts-1)/(1+sa/sqrt(r));
Se = ka*kb*kc*kd*kf*kf*kfs*Se_ideal;

end