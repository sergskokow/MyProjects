function PI = spigotPI(n)
  pi = int8([]);                  % result array
  array_size = floor(10*n/3)+1;
  A = 2 * ones(1, array_size);    % initialize
  r = zeros(1, array_size);       % remainders
  delta = 0;                      % carrying over
  for k = 1:n
    A *= 10;
    for i = array_size-1:-1:0
      sum = A(i+1) + delta;
      r(i+1) = rem(sum, 2*i+1);
      delta = idivide(sum, 2*i+1) * i;
    endfor
    
    if sum > 99                   % overflow control
      i = k - 1;
      while pi(i)==9
        pi(i) = 0;                % up to sum=199
        --i;
      endwhile
      ++pi(i);
      pi(k) = idivide(rem(sum, 100), 10);
    else
      pi(k) = idivide(sum, 10);
    endif
    r(1) = rem(sum, 10);
    A = r;
  endfor
  PI = pi_to_string(pi);
endfunction

% print result
function str = pi_to_string(array)
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