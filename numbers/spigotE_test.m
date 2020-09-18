function spigotE_test(n)
  tic; myE = spigotE(n); toc

  E = regexp(urlread("http://gutenberg.org/files/127/127.txt"),...
              "2\\.7[\\d\\s]+", "match"){end};
  E = regexprep(E, "\\s+", "");
  if strncmp(myE, E, n+1)     % n digits with dot
    disp('Everything is OK.')
  else
    disp('Error!')
  endif

  disp(['Calculated:', myE])
  disp(['Actually  :', E(1:n+1)])
endfunction