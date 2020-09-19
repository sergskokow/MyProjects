function decimal = b2d(binary)
  decimal = 0;
  for digitId=length(binary):-1:1
    decimal += binary(digitId) * 2^(length(binary)-digitId);
  endfor
endfunction