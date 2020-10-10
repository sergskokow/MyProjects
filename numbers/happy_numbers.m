function numbers = happy_numbers(first)
  numbers = [];
  found = 0;
  number = 1;
  while found < first
    happy = is_happy(number, 10);
    if happy
      numbers = [numbers number];
      found++;
    endif
    number++;
  endwhile
endfunction

function [i, numbers] = is_happy(number, iterations)
  numbers = [];
  for c = 1:iterations
    digits = get_digits(number);
    number = 0;
    for d = digits
      number += d ^ 2;
    endfor
    if find(ismember(numbers, number)) % infinite loop
      i = 0;
      return;
    endif
    numbers = [numbers number];
    if number == 1 % happy number
      i = 1;
      return;
    endif
  endfor
  i = 0;
endfunction

function digits = get_digits(number)
  digits = [];
  while number >= 1
    digits = [mod(number, 10) digits];
    number = idivide(number, 10);
  endwhile
endfunction