% source \ target
temp =...
{'\',        'Kelvin',          'Celsius',       'Fahrenheit';
'Kelvin' ,   @(k) k,            @(k) k+273.15,   @(k) (k+459.67)*5/9;
'Celsius',   @(c) c-273.15,     @(c) c,          @(c) 9/5*c+32;
'Fahrenheit' @(f) f*9/5-459.67, @(f) 5/9*(f-32), @(f) f
};
mass =...
{'\', 'g',         'kg',        'mg',       't';
'g',  @(g) g,      @(g) 1e-3*g, @(g) 1e3*g, @(g) 1e-6*g;
'kg', @(k) 1e3*k,  @(k) k,      @(k) 1e6*k, @(k) 1e-3*k;
'mg', @(m) 1e-3*m, @(m) 1e-6*m, @(m) m,     @(m) 1e-9*m;
't',  @(t) 1e6*t,  @(t) 1e3*t,  @(t) 1e9*t, @(t) t
};
volume =...
{'\', 'm3',          'l',           'ml';
'm3', @(m3) m3,      @(m3) 1e3*m3,  @(m3) 1e6*m3;
'l',  @(l) 1e-3*l,   @(l) l,        @(l) 1e3*l;
'ml', @(ml) 1e-6*ml, @(ml) 1e-3*ml, @(ml) ml
};
currency =...
{'\', 'USD',       'EUR',      'RUB';
'USD', @(u) u,     @(u) 0.84*u, @(u) 75*u;
'EUR', @(e) 1.2*e, @(e) e,      @(e) 90*e;
'RUB', @(r) r/75,  @(r) r/90,   @(r) r
};

types =...
{'Temperature', temp;
 'Mass',        mass;
 'Volume',      volume;
 'Currency',    currency
};

type = menu('Select converter type', types{:, 1});
from = menu('Select source unit', types{type, 2}{2:end, 1});
to = menu('Select target unit', types{type, 2}{1, 2:end});
disp(['Converting from ', types{type, 2}{from+1, 1},...
                  ' to ', types{type, 2}{1, to+1}])
value = input('Enter value: ');

types{type, 2}{from+1, to+1}(value)