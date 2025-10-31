f = inline('x*x*x-4*x*x+x+6');
root = input('Enter root of the function = ');
a = input('Enter the value of a = ');
b = input('Enter the value of b = ');
n= input('Enter the value of No. of iterations = ');
y0 = f(a);
y1 = f(b);
while (y0*y1>0)
  a = input('Enter the value of a = ');
  b = input('Enter the value of b = ');
  y0 = f(a);
  y1 = f(b);
end
for i = 1:1:n
  c = (a+b)/2;
  y2 = f(c);
  if (y0*y2<0)
    b=c;
    y1 = f(c);
  else
    a=c;
    y1 = f(b);
  endif
end
fprintf('Root of the Equation = %f\n',c);
fprintf('Error = %f\n',abs(c-root)*100);

