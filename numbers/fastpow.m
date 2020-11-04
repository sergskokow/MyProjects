function pow = fastpow(x, n)
  n = dec2bin(n);
  pow = x;
  for current = n(2:end)
    pow ^= 2;
    if current == 1
      pow *= x;
    endif
  endfor
endfunction