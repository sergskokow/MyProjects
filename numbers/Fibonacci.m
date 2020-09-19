function F = Fibonacci(n)
  seq = [];
  m = [0 1; 1 1];
  for i=1:2:n-1
    seq = [seq m(2,:)];
    m *= [1 1;1 2];
  endfor
  if mod(n, 2)
    seq = [seq ([0 1;1 1]^n)(2,1)];
  endif
  F = seq;
endfunction