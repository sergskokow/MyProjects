function binary = d2b(decimal)
  binary = [];
  while decimal != 1
    binary = [mod(decimal, 2) binary];
    decimal = idivide(decimal, 2);
  endwhile
  binary = [1 binary];
endfunction