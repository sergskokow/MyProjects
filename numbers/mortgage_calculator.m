function monthly_payment = mortgage_calculator(loan, rate, months)
  rate /= 100;
  monthly_rate = rate / 12;
  base = 1 + monthly_rate;
  monthly_payment = loan * monthly_rate*base^months / (base^months-1);
endfunction