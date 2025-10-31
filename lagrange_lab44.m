time = [0, 4, 8, 12, 16, 20, 24];
energy = [1.2, 2.8, 3.5, 4.0, 3.2, 2.5, 1.0];

predict_points = [2, 7,10, 20,21,22];

function L = lagrange_interpolation(x, y, xi)
    n = length(x);
    L = 0;

    for i = 1:n

        term = y(i);
        for j = 1:n
            if j ~= i
                term = term * (xi - x(j)) / (x(i) - x(j));
            end
        end
        L = L + term;
    end
end


lagrange_results = zeros(size(predict_points));
for i = 1:length(predict_points)
    lagrange_results(i) = lagrange_interpolation(time, energy, predict_points(i));
end


fprintf('Lagrange Interpolation Predictions:\n');
for i = 1:length(predict_points)
    fprintf('Time: %.1f, Energy: %.4f\n', predict_points(i), lagrange_results(i));
end


t_fine = 0:0.1:24;
spline_curve = spline(time, energy, t_fine);


spline_results = spline(time, energy, predict_points);


fprintf('\nCubic Spline Predictions:\n');
for i = 1:length(predict_points)
    fprintf('Time: %.1f, Energy: %.4f\n', predict_points(i), spline_results(i));
end


figure;

hold on;
plot(t_fine, spline_curve, '-r', 'LineWidth', 1.5, 'DisplayName', 'Cubic Spline');
plot(predict_points, lagrange_results, 'xg', 'MarkerSize', 10, 'DisplayName', 'Lagrange Predictions');
plot(predict_points, spline_results, 'sk', 'MarkerSize', 10, 'DisplayName', 'Spline Predictions');
xlabel('Time (hours)'); ylabel('Energy Consumption (kWh)');
title('Energy Consumption: Lagrange vs Spline Interpolation');
legend show;
grid on;
hold off;


abs_error = abs(lagrange_results - spline_results);
percent_error = (abs_error ./ spline_results) * 100;

% Display Error Analysis
fprintf('\nError Analysis:\n');
for i = 1:length(predict_points)
    fprintf('Time: %.1f, Absolute Error: %.4f, Percent Error: %.2f%%\n',predict_points(i), abs_error(i), percent_error(i));
end
