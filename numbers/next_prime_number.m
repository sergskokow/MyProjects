function npn = next_prime_number()
  n = 2;
  while true
    if is_prime(n)
      disp(n)
      pause;
    endif
    if mod(n, 2)
      n += 2;
    else
      ++n;
    endif
  endwhile
endfunction

function i = is_prime(n)
  max = fix(sqrt(n));
  for i = 2:max
    if mod(n, i) == 0
      i = false;
      return;
    endif
  endfor
  i = true;
endfunction