% Data points
x = [1, 2, 3, 4];
y = [1, 4, 9, 16];

%% Part (a): Lagrange Interpolation
% Function for Lagrange Interpolation
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

% Interpolated value at x = 2.5
xi = 2.5;
yi_lagrange = lagrange_interpolation(x, y, xi);
fprintf('Lagrange Interpolation: y(%.1f) = %.4f\n', xi, yi_lagrange);

%% Part (b): Cubic Spline Interpolation
xx = 1:0.1:4; % Range of x for interpolation
yy_spline = spline(x, y, xx); % Cubic spline interpolation

% Plotting
figure;
plot(x, y, 'o', 'MarkerSize', 8, 'DisplayName', 'Data Points'); % Original data points
hold on;
plot(xx, yy_spline, '-r', 'LineWidth', 1.5, 'DisplayName', 'Cubic Spline'); % Spline curve
xlabel('x'); ylabel('y');
title('Lagrange and Cubic Spline Interpolation');
legend show;
grid on;
hold off;

