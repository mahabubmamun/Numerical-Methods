f = inline('x*x*x-4*x*x+x+6');
df = inline('3*x*x-8*x+1');
ddf = inline('6*x-8');
root = input('Enter root of the function = ');
x1 = input('Enter the guess value = ');
n= input('Enter the value of No. of iterations = ');
y1 = f(x1);
y2 = df(x1);
y3 = ddf(x1);
a = (y1*y3)/(y2*y2);
while (abs(a)>1)
  x1 = input('Enter the guess value = ');
  y1 = f(x1);
  y2 = df(x1);
  y2 = ddf(x1);
  a = (y1*y3)/(y2*y2);
end
for i = 1:1:n
  x2 = x1 - (y1/y2);
  x1 = x2;
  y1 = f(x1);
  y2 = df(x1);
  errors=abs(x2-root);
  % Plot the error
plot(errors, '-o');

end
fprintf('Root of the equation = %f\n',x2);
fprintf('Error = %f\n',abs(root-x2)*100);
%errors=root-x2
% Plot the error
figure;
%plot(errors, '-o');
title('Error per Iteration (Newton-Raphson Method)');
xlabel('Iteration');
ylabel('Error');
grid on;
