cost = input('Enter a cost: ');
tax_ = input('Enter a tax (%): ');
disp(['Tax (', num2str(tax_), '%): ', num2str(cost*tax_/100)])
disp(['Total: ', num2str(cost+cost*tax_/100)])