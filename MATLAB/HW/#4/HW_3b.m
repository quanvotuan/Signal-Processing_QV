clc

x = [ 1 2 3 4 5 ];
y = [ 1 1 1 1 1 -5 ];

% Determine Nmax based on input signal
%   Finite-length   length(y) - length(x) + 1
%   Infinite-length length(x)
Nmax = length(y) - length(x) + 1;   %% finite-length input signal
if ( Nmax < 2 )
    Nmax = length(x);
end

b = zeros(1, Nmax);
b(1) = y(1) / x(1);
% b(2) = ( y(2) - b(1)*x(2) ) / x(1);
% b(3) = ( y(3) - b(1)*x(3) - b(2)*x(2) ) / x(1);
for k = 2:Nmax
    numer = y(k);
    n = k;
    for m = 1:(k-1)
	if (n >= 1)
            numer = numer - b(m) * x(n);
	end
        n = n - 1;
    end
    b(k) = numer / x(1);
    if (abs(b(k) - b(k-1)) <= (1e-7)*abs(b(k)))
        break;
    end
end

% utdeconvolve.m. implements the above algorithm for deconvolution.

% Part (a).  Give the vectors for x and y that you used when running
% utdeconvolve.m. and the filter coefficients in vector b that the code computes.

fprintf('y: [')
fprintf('%d, ', y(1:end-1))
fprintf('%d]\n', y(end))

fprintf('Here is the x vector: [');
fprintf('%d, ', x(1:end-1));
fprintf('%d]\n', x(end))

fprintf('Here is the y vector: [');
fprintf('%d, ', y(1:end-1));
fprintf('%d]\n', y(end))

fprintf('Here is the b vector: [');
fprintf('%d, ', b(1:end-1));
fprintf('%d]\n', b(end))

% Part (b). Verify that the filter coefficients by using them in the difference
% equation for the LTI FIR filter.  You can use the Matlab command conv(x, b).
c = conv(x,b);

fprintf('Here is the c vector: [');
fprintf('%d, ', c(1:end-1));
fprintf('%d]\n', c(end))