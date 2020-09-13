function spigotPI_test(n)
  tic; myPI = spigotPI(n); toc
  PI = regexp(urlread("https://www.piday.org/million/"),...
              "3.14\\d+", "match"){end};
  strncmp(myPI, PI, n+1)                # n digits with dot
  disp(['Calculated:', myPI])
  disp(['Actually  :', PI(1:n+1)])
  
  # performance
  disp('Performance test...')
  n = [5 20 50 100];
  for i=1:length(n)
    tic
    spigotPI(n(i));
    t(i) = toc;
  endfor
  plot(n,t);
  grid on;
  xlabel('Digits');
  ylabel('Time, seconds');
  title('My spigot-\pi implementation performance')
endfunction