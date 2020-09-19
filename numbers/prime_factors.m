function pf = prime_factors(n)
  max = fix(sqrt(n));
  for i = 2:max
    if mod(n, i) == 0
      pf = [i prime_factors(n/i)];
      return;
    endif
  endfor
  pf = n;
endfunction