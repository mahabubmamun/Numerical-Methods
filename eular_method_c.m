clc;
clear;

h = 0.1; % prim step
t_start = 0;
t_end = 5; % interval bola ache
y0 = 1; %prothom condition
t = t_start:h:t_end; %eta time arr
n = length(t);

y = zeros(1, n); %y er value gula
y(1) = y0; %prthom y

for i = 1:n-1
    y(i+1) = y(i) + h * (-2 * y(i) + 4);
end

figure;
plot(t, y, 'b-o');
title("Numerical Sol using Eulers Method");
xlabel("Time t");
ylabel("y(t)");
grid on;



y_analytical = 2 - (2 - y0) * exp(-2 * t);
error = abs(y - y_analytical);

figure;
plot(t, y, 'b-o', 'DisplayName', 'Euler’s Method');
hold on;
plot(t, y_analytical, 'r-', 'DisplayName', 'Analytical Solution');
legend;
title("Comparison of Numerical and Analytical Solutions");
xlabel("Time t");
ylabel("y(t)");
grid on;

figure;
plot(t, error, 'k-o');
title("Error between Numerical and Analytical Solutions");
xlabel("Time t");
ylabel("Error");
grid on;

step_sizes = [0.0000005, 0.08, 0.2];

figure;

for j = 1:length(step_sizes)
    h = step_sizes(j);
    t = t_start:h:t_end;
    n = length(t);
    y = zeros(1, n);
    y(1) = y0;

    for i = 1:n-1
        y(i+1) = y(i) + h * (-2 * y(i) + 4);
    end

    y_analytical = 2 - (2 - y0) * exp(-2 * t);
    error = abs(y - y_analytical);

    subplot(3, 1, j);
    plot(t, error, 'k-o');
    # title("Error between Numerical and Analytical Solutions for h = " + h);
    xlabel("Time t");
    ylabel("Error");
    grid on;
end

# % Add a title manually above all subplots
# axes('Position', [0 0.95 1 0.05], 'Visible', 'off');
# text(0.5, 0, "Error Analysis for Different Step Sizes", ...
#     'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold');
