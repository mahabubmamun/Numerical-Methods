% Problem Statement: Solving an ODE using Euler's Method

% Parameters
h = 0.1; % step size
t0 = 0;  % start time
tf = 5;  % end time
y0 = 1;  % initial condition
N = (tf - t0) / h; % number of steps

% Preallocate arrays
t = t0:h:tf; % time array
y_numeric = zeros(size(t)); % numeric solution array
y_numeric(1) = y0; % initial value

% Euler's Method implementation
for n = 1:N
    y_numeric(n+1) = y_numeric(n) + h * (-2 * y_numeric(n) + 4);
end

% Analytical solution
y_analytical = 2 - (2 - y0) * exp(-2 * t);

% Compute the error
error = abs(y_numeric - y_analytical);

% Plot the results
figure;
plot(t, y_numeric, '-o', 'DisplayName', 'Numerical Solution (Euler)');
hold on;
plot(t, y_analytical, '-r', 'DisplayName', 'Analytical Solution');
xlabel('Time t');
ylabel('y(t)');
title('Euler Method vs Analytical Solution');
legend;
grid on;

% Display results
disp('Time values:');
disp(t);
disp('Numerical Solution:');
disp(y_numeric);
disp('Analytical Solution:');
disp(y_analytical);
disp('Error at each step:');
disp(error);

% Part 3: Investigating different step sizes
for h = [0.05, 0.1, 0.2]
    N = (tf - t0) / h; % update steps
    t = t0:h:tf; % time array
    y_numeric = zeros(size(t)); % numeric solution array
    y_numeric(1) = y0; % initial value

    % Euler's Method for new h
    for n = 1:N
        y_numeric(n+1) = y_numeric(n) + h * (-2 * y_numeric(n) + 4);
    end

    % Analytical solution for new h
    y_analytical = 2 - (2 - y0) * exp(-2 * t);
    error = abs(y_numeric - y_analytical);

    % Display results for different h
    fprintf('Results for h = %.2f:\n', h);
    disp('Time values:');
    disp(t);
    disp('Numerical Solution:');
    disp(y_numeric);
    disp('Analytical Solution:');
    disp(y_analytical);
    disp('Error at each step:');
    disp(error);
end
