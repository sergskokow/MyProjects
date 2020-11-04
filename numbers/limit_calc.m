f = input('Enter a function, e.g. @(x)x^2: ');
to = input('To: ');
if abs(to) == inf
  to = sign(to) * 1e12;
  f(to)
else
  f(to - 1e-12)
endif