function spigotPI_test(n)
  tic; myPI = spigotPI(n); toc

  PI = regexp(urlread("https://www.piday.org/million/"),...
              "3.14\\d+", "match"){end};
  if strncmp(myPI, PI, n+1)     % n digits with dot
    disp('Everything is OK.')
  else
    disp('Error!')
  endif

  disp(['Calculated:', myPI])
  disp(['Actually  :', PI(1:n+1)])
endfunction