function [flag, num, t, m] = bitStringToDecimalConversion(s,exponent,mantissa)
% [flag, num, t, m] = bitStringToDecimalConversion(s,exponent,mantissa
%  author: Curran Robertson

%  Conversion of bit string into a decimal number.
%    input
%        s = sign of bit string (a zero or one)
%        exponent = exponent of bit string (vector of 8 zeros or ones) 
%        mantissa = mantissa of bit string (vector of 23 zeros or ones)
%
% output: flag = flag to signify program executed properly or not
%             flag = 0 --> output is fine
%             flag = 1 --> output contains problems
%             
%         num = decimal number associated with the bit string
%         t = number derived from the exponent 
%         m = number derived from the mantissa

% sample 
% [flag, num, t, m] = bitStringToDecimalConversion(1, [0,1,1,1,1,0,1,1], [1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
% initialize flag (unless error is found by the program the flag will be
% zero)

% dimensions of each variable
size_s = size(s);
size_exponent = size(exponent);
size_mantissa = size(mantissa);

% check if s has the right size
if size_s(2) ~= 1
    flag = 1;
    num = -666;
    t = 0;
    m = 0;
    return;
end

% check if exponent has the right size
if size_exponent(2) ~= 8
    flag = 1;
    num = -666;
    t = 0;
    m = 0;
    return;
end

% check if mantissa has the right size
if size_mantissa(2) ~= 23
    flag = 1;
    num = -666;
    t = 0;
    m = 0;
    return;
end
    
flag = 0;

sum = 0;
a = 0;
% t calculation
for k = 8:-1:1
    sum = sum + exponent(k) * 2^(a);
    a = a + 1;
end
t = sum;

sum = 0;

% m calculation
for k = 1:23
    sum = sum + mantissa(k) * 2 ^ (-k);
end
m = sum;

% decimal number calculation

num = ((-1)^s) * (1+m) * 2^(t-127);

