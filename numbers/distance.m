coords =...     latitude   longitude
{'Moscow',     [55.751244  37.618423];
 'Washington', [38.899513 -77.036527];
 'Korolev',    [55.922212  37.854629];
 'Houston',    [29.763693 -95.363183];
 'Berlin',     [52.520008  13.404954];
 'Paris',      [48.864716   2.349014];
 'Kiev',       [50.450441  30.523550];
 'Beijing',    [39.901843 116.391433];
 'Tokyo',      [35.681700 139.753882]};

city1 = menu('Select city #1', coords{:, 1});
city2 = menu('Select city #2', coords{:, 1});
disp(['Distance between ', coords{city1, 1}, ' and ' coords{city2, 1}])
city1 = deg2rad(coords{city1, 2});
city2 = deg2rad(coords{city2, 2});

sind = sin(city2(2)-city1(2));
cosd = cos(city2(2)-city1(2));
sin1 = sin(city1(1));
sin2 = sin(city2(1));
cos1 = cos(city1(1));
cos2 = cos(city2(1));

km = 6371*atan2(sqrt((cos2*sind)^2 + (cos1*sin2-sin1*cos2*cosd)^2),...
            ...---------------------------------------------------
                         sin1*sin2 + cos1*cos2*cosd);
ml = 0.621371*km;

units = {'Kilometres', km; 'Miles', ml};
unit = menu('Select units', units{:, 1});
units{unit, 2}
disp(units{unit, 1})