function E = spigotE(n)
  e = int8([]);
  array_size = n + 1;
  A = ones(1, array_size);        % initialize
  r = zeros(1, array_size);       % remainders
  delta = 0;                      % carrying over
  for k = 1:n-1
    A *= 10;
    for i=array_size-1:-1:0
      sum = A(i+1) + delta;
      r(i+1) = rem(sum, i+2);
      delta = idivide(sum, i+2);
    endfor
    
    if sum > 99                   % overflow control
      i = k - 1;
      while e(i)==9
        e(i) = 0;                 % up to sum=199
        --i;
      endwhile
      ++e(i);
      e(k) = idivide(rem(sum, 100), 10);
    else
      e(k) = idivide(sum, 2);
    endif
    A = r;
  endfor
  e = [2 e];
  E = e_to_string(e);
endfunction

% print result
function str = e_to_string(array)
  s = "";
  for digitId = 1:length(array)
    if digitId == 1
      s = [num2str(array(1)) '.'];
    else
      s = [s num2str(array(digitId))];
    endif
  endfor
  str = s;
endfunction