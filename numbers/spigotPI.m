function res = spigotPI(n)
  s = "";                         # result string
  array_size = floor(10*n/3)+1;
  A = 2 * ones(1, array_size);    # initialize
  r = zeros(1, array_size);       # remainders
  delta = 0;                      # carrying over
  for k = 1:n
    A = A * 10;
    for i = array_size-1:-1:0
      sum = A(i+1)+delta;
      r(i+1) = rem(sum, 2*i+1);
      delta = idivide(sum, 2*i+1) * i;
    endfor
    s = strcat(s, num2str(first(sum)));
    if k == 1
      s = strcat(s, '.');
    endif
    r(1) = rem(sum, 10);
    A = r;
  endfor
  res = s;
endfunction

# first digit of number
function f=first(number)
  while number > 10
    number = idivide(number, 10);
  endwhile
  f = number;
endfunction