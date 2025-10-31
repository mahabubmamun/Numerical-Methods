%Lagrange Interpolation and Plot
% Define the given data points (x, y)
x = [0,4,8,12,16,20,24]; %x means time
y = [1.2,2.8,3.5,4.0,3.2,2.5,1.0] %y means energy
points=[2,7,10,22]
len=length(x);

xi = linspace(min(x), max(x), 100);
function L = lagrange_interpolation(x, y, xi)
    n = length(x);
    L = 0; % Initialize result

    for i = 1:n
        % Compute individual terms of the Lagrange polynomial
        term = y(i);
        for j = 1:n
            if j ~= i
                term = term * (xi - x(j)) / (x(i) - x(j));
            end
        end
        L = L + term;
    end
end

% Prediction using Lagrange interpolation formula for given points
predictions = zeros(1, length(points));
for i = 1:length(points)
    predictions(i) = lagrange_interpolation(x, y, points(i)); % Compute for each point
end

% Display results
disp('Lagrange Interpolation prediction');
for i = 1:length(points)
    fprintf('At t = %.2f, Energy = %.4f kWh\n', points(i), predictions(i));
end

% Calculate interpolated values for the plot
yi = lagrange_interpolation(x, y, xi); % Compute for smooth range xi

% Plot the results
figure;
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Original data points
hold on;
plot(xi, yi, 'b-', 'LineWidth', 1.5); % Interpolated curve
plot(x_target, y_target, 'ks', 'MarkerSize', 8, 'LineWidth', 2); % Evaluated point
grid on;
title('Lagrange Interpolation');
xlabel('x');
ylabel('y');
legend('Data Points', 'Lagrange Polynomial', 'Evaluated Point', 'Location', 'Best');
hold off;




