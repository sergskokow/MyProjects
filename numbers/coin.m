count = input('Enter the count of flips: ');
flips = randi(2, 1, count) - 1; % 0 = head, 1 = tail
step = 5;
steps = 1:step:count-step;
r = flips(1);
heads = flips(1);
for i = steps
  heads += sum(flips(i+1:i+step));
  r = [r heads/(i+step)];
endfor

semilogx([steps steps(end)+step], r.*100)
title(['Tails to heads (step ' num2str(step) ')'])
xlabel('Flips')
ylabel('Tails to heads, %')
grid on