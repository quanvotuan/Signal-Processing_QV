% Define your input signal x[n] (you can change this as needed)
x = [1, 2, 3, 4, 5];  % Example input signal

% Define the value of q (you can change this as needed)
q = 0.5;  % Example value for q

% Calculate w[n] using the equation
w = x - q * x - 1;

% Display the result
disp('w[n] = ');
disp(w);