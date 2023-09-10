% Curran Robertson
% This program calculates the percent error of the first value of the
% series solution to the Transcendental Equation (for heat transfer through a wall) compared to a numerical
% approximation of the exact value of the Transcendental Equation. It does
% this for a range of Fourier Numbers (t*) and produces a plot of the results.
% newtonraphson.m is required to be in the same folder.

clear all; clc; close all

% Declaration of Constants
Tinf =  1200; % Ambient temperature (K)
Ti = 273; % Initial temperature (K)
Bi = 25.0; % Biot Number (hL/k)
x_star = 1; % x*
iterations = 100; % Number of values in infinite series

% Add plot points for incremented values of Fourier's Number
for Fo = 0:0.05:0.3

    % Initialize variables for while loop
    i = 1;
    phi_star = 0;

    % Initial guess for Newton Raphson input depends on Biot Number
    if (Bi >=0 ) && (Bi < 0.1)
        xr = 0.1; % Initial guess input for Newton Raphson function
    elseif (Bi >= 0.1) && (Bi < 1.0)
        xr = 0.7;
    elseif (Bi >= 1.0) && (Bi < 10.0)
        xr = 1.3;
    elseif (Bi >= 10.0) && (Bi <= 40.0)
        xr = 1.5;
    else
        fprintf('Biot number not in range')

        return;
    end

    % Execute Newton Raphson Method for specified number of iterations
    while i <= iterations

        func = @(lambda) lambda*tan(lambda) - Bi; % Transcendental Equation
        dfunc = @(lambda) lambda*sec(lambda)^2+tan(lambda); % Derivative of Transcendental Equation
        [xf] = newtonraphson(func,dfunc,xr); % Call Newton-Raphson Function to find lambda
        lambda_n = xf;

        C_n = 4*sin(lambda_n)/(2*lambda_n+sin(2*lambda_n)); % calculate C_n
        phi_star = phi_star + C_n*exp(-lambda_n^2*Fo)*cos(lambda_n*x_star); % Series Equation

        if i == 1
            approx = phi_star; % Approximate solution (value used on tests)
        end

        i = i+1; % Increment i
        xr = lambda_n + pi(); % Update initial guess input for Newton_raphson function
    end

    T = phi_star*(Ti-Tinf) + Tinf; % Solve for T in Eq. 5.34

    T_approx = approx*(Ti-Tinf) + Tinf; % Approximate solution with C_1 lambda_1

    pe = abs((T-T_approx)/T)*100; % Percent error

    % Plot percent error with respect to Fourier's Number
    hold on
    plot(Fo, pe, '-o')
    text(Fo, pe, ['   ', num2str(pe), '%']);
    t = title("Percentage Error vs Fourier's Number (Bi = 25.0)");
    t.FontSize = 20;;
    x = xlabel("Fourier's Number (t^*)");
    x.FontSize = 16;
    y = ylabel("Percent Error (%)");
    y.FontSize = 16;
end
