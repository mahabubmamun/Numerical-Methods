time = [0, 4, 8, 12, 16, 20, 24];
energy = [1.2, 2.8, 3.5, 4.0, 3.2, 2.5, 1.0];

predict_times = [2, 7, 10, 22];

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

lagrange_results = zeros(size(predict_times));
for i = 1:length(predict_times)
    lagrange_results(i) = lagrange_interpolation(time, energy, predict_times(i));
end


fprintf('Lagrange Interpolation Predictions:\n');
for i = 1:length(predict_times)
    fprintf('Time: %.1f, Energy: %.4f\n', predict_times(i), lagrange_results(i));
end


t_fine = 0:0.1:24;
spline_curve = spline(time, energy, t_fine);


spline_results = spline(time, energy, predict_times);


fprintf('\nCubic Spline Predictions:\n');
for i = 1:length(predict_times)
    fprintf('Time: %.1f, Energy: %.4f\n', predict_times(i), spline_results(i));
end


figure;

hold on;
plot(t_fine, spline_curve, '-r', 'LineWidth', 1.5, 'DisplayName', 'Cubic Spline');
plot(predict_times, lagrange_results, 'xg', 'MarkerSize', 10, 'DisplayName', 'Lagrange Predictions');
plot(predict_times, spline_results, 'sk', 'MarkerSize', 10, 'DisplayName', 'Spline Predictions');
xlabel('Time (hours)'); ylabel('Energy Consumption (kWh)');
title('Energy Consumption: Lagrange vs Spline Interpolation');
legend show;
grid on;
hold off;


abs_error = abs(lagrange_results - spline_results);
percent_error = (abs_error ./ spline_results) * 100;

% Display Error Analysis
fprintf('\nError Analysis:\n');
for i = 1:length(predict_times)
    fprintf('Time: %.1f, Absolute Error: %.4f, Percent Error: %.2f%%\n',predict_times(i), abs_error(i), percent_error(i));
end
