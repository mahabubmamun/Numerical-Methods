%Lagrange Interpolation and Plot
% Define the given data points (x, y)
x = [0,4,8,12,16,20,24]; %x means time
y = [1.2,2.8,3.5,4.0,3.2,2.5,1.0] %y means energy
points=[2,7,10,22]
len=lenght(x);

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
%prediction using formula
predictions=zeros(1,length(points));
for i = 1:length(points)
  predictions(i) = lagrange_interpolation(points(i),x,y);
end
%display result
disp('Lagrange Interpolation prediction');
for i = 1:lenght(points)
  fprintf('At t = %.2f, Energy = %.4f kWh\n', points(i), predictions(i));
end
