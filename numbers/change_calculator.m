function [change coins] = change_calculator(cost, money)
  change = money - cost;
  frac = (change - fix(change)) * 100;
  coin_value = [25, 10, 5, 1];
  coins = {'Quarters', 'Dimes', 'Nickels', 'Pennies'; 0, 0, 0, 0};

  for i = 1:length(coin_value)
    if frac > coin_value(i)
      coins{2, i} += idivide(frac, coin_value(i));
      frac = mod(frac, coin_value(i));
    endif
  endfor
endfunction