% Lagrange Interpolation and Plot

% Define the given data points (x, y)
x = [0, 4, 8, 12, 16, 20, 24]; % Time (hours)
y = [1.2, 2.8, 3.5, 4.0, 3.2, 2.5, 1.0]; % Energy Consumption (kWh)

% Define the interpolation range
xi_interp = linspace(min(x), max(x), 100); % Points to interpolate
yi_interp = zeros(size(xi_interp)); % Initialize the interpolated values

% Number of data points
n = length(x);

% Perform Lagrange Interpolation
for k = 1:n
    % Calculate the Lagrange basis polynomial L_k(x)
    Lk = ones(size(xi_interp));
    for j = [1:k-1, k+1:n] % Exclude the k-th term
        Lk = Lk .* (xi_interp - x(j)) / (x(k) - x(j));
    end

    % Add contribution of L_k(x) * y(k) to yi
    yi_interp = yi_interp + y(k) * Lk;
end

% Evaluate the interpolated value at a specific point (e.g., x_target = 3.6)
x_target = 3.6;
y_target = 0; % Initialize

for k = 1:n
    % Calculate the Lagrange basis polynomial at x_target
    Lk_target = 1;
    for j = [1:k-1, k+1:n]
        Lk_target = Lk_target * (x_target - x(j)) / (x(k) - x(j));
    end

    % Add contribution of L_k(x_target) * y(k) to y_target
    y_target = y_target + y(k) * Lk_target;
end

% Display the interpolated value
fprintf('Interpolated value at x = %.1f is y = %.4f\n', x_target, y_target);

% Plot the results
figure;
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Original data points
hold on;
plot(xi_interp, yi_interp, 'b-', 'LineWidth', 1.5); % Interpolated curve
plot(x_target, y_target, 'ks', 'MarkerSize', 8, 'LineWidth', 2); % Evaluated point
grid on;
title('Lagrange Interpolation');
xlabel('x (Time)');
ylabel('y (Energy Consumption)');
legend('Data Points', 'Lagrange Polynomial', sprintf('Point (x = %.1f)', x_target), 'Location', 'Best');
hold off;

