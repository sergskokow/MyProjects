function name = number_name(number)
  name = '';

  % +- 999 billion . 999 billionth (actually working with get_parts2)
  names = cell(5, 12);
  names = {
    {'one ','two ','three ','four ','five ','six ','seven ',...
     'eight ','nine ','ten ','eleven ','twelve '},... 1 - 12
    {'thir','four','fif','six','seven','eigh','nine'},... 13 - 19
    {'twen','thir','for','fif','six','seven','eigh','nine'},... 20 - 90
    {'thousand ','million ','billion '}};% 1e3 - 1e9

  [integer fractional] = get_parts(number);
  current_is_integer = fractional == 0;
  if current_is_integer
    current_part = integer;
  else
    current_part = fractional; % begin at fractional part if it exists
  endif
  while true
    level = 0; % 1 = thousand, 2 = million, 3 = billion
    while current_part
      [dec, current_part] = get_digits(current_part, 2);
      if dec > 0
        if dec <= 12
          name = [names{1}{dec} name];
        elseif dec <= 19
          name = [names{2}{dec-12} 'teen ' name];
        else
          x = get_digits(dec, 1);
          if x
            name = [names{3}{idivide(dec, 10)-1} 'ty ' names{1}{x} name];
          else
            name = [names{3}{idivide(dec, 10)-1} 'ty ' name];
          endif
        endif
      endif

      if current_part > 0
        if dec
          name = ['and ' name];
        endif
        [x, current_part] = get_digits(current_part, 1);
        if x
          name = [names{1}{x} 'hundred ' name];
        endif
      endif

      if current_part > 0
        name = [names{4}{++level} name];
      endif
    endwhile

    if ~current_is_integer
      name = ['point ' name];
      current_part = integer;
      current_is_integer = true;
    else
      if integer == 0
        name = ['zero ' name];
      endif
      break;
    endif
  endwhile

  if sign(number) < 0
    name = ['minus ' name];
  endif
  name = strtrim(name);
endfunction

% returns right digits of a number (right-to-left direction) and a number without them
function [digits, new_number] = get_digits(number, count)
    digits = mod(number, 10^count);
    new_number = idivide(number-digits, 10^count);
endfunction

% returns parts of a number as unsigned integers
function [integer fractional] = get_parts(number)
  number = abs(number);
  integer = fix(number);
  if number ~= integer
    str = num2str(number); % not good but works much better than (num-fix(num))*10^n
    fractional = str2num(str(findstr(str, '.')+1:end));
  else
    fractional = 0;
  endif
endfunction

% returns parts of a number as unsigned integers
% version for big numbers
function [integer fractional] = get_parts2(number_as_str)
  if number_as_str(1) == '-'
    number_as_str = number_as_str(2:end); % abs
  endif
  dot = findstr(number_as_str, '.');
  if length(dot) == 0  % integer
    integer = str2num(number_as_str);
    fractional = 0;
  else
    if dot == 1 % .5 , .12
      integer = 0;
    else
      integer = str2num(number_as_str(1:dot-1));
    endif
    fractional = str2num(number_as_str(dot+1:end));
  endif
endfunction