f = inline('x*x*x-4*x*x+x+6');
root = input('Enter root of the function = ');
x0 = input('Enter the value of x0 = ');
x1 = input('Enter the value of x1 = ');
n= input('Enter the value of No. of iterations = ');
y0 = f(x0);
y1 = f(x1);
while (y0*y1>0)
  x0 = input('Enter the value of x0 = ');
  x1 = input('Enter the value of x1 = ');
  y0 = f(x0);
  y1 = f(x1);
end
for i = 1:1:n
  x2 = x1 - ((x1-x0)/(y1-y0))*y1;
  x0=x1;
  x1=x2;
  y0=f(x0);
  y1=f(x1);
  errors=x2-root;
end
fprintf('root of the function is = %f\n',x2);
fprintf('Error = %f\n',abs(root-x2)*100);
%errors = root-x2;
% Plot the error
figure;
plot(errors, '-o');
title('Error per Iteration (Secant Method)');
xlabel('Iteration');
ylabel('Error');
grid on;
