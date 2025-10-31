% Define the transformed function g(x) for iteration
g = @(x) sqrt((x^3 + x + 6) / 4);

% Inputs
x0 = input('Enter the initial guess for the root: ');
n = input('Enter the maximum number of iterations: ');

% Initialize an array to store errors for analysis
errors = [];

% One-Point Iteration
for i = 1:n
    % Compute next approximation of root
    x1 = g(x0);

    % Calculate error and store it
    err = abs(x1 - x0);
    errors = [errors, err];

    % Check for convergence
    if err < tol
        fprintf('Converged to root x = %f after %d iterations.\n', x1, i);
        break;
    end

    % Update x0 for the next iteration
    x0 = x1;
end

% If maximum number of iterations is reached without convergence
if err >= tol
    fprintf('Did not converge within %d iterations. Last approximation is x = %f.\n', n, x1);
end

% Plot the error
figure;
plot(errors, '-o');
title('Error per Iteration (One-Point Iteration Method)');
xlabel('Iteration');
ylabel('Error');
grid on;

