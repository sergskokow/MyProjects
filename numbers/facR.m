function f = facR(n)
  if n==0 || n==1
    f = 1;
  else
    f = n * facR(n-1);
  endif
endfunction