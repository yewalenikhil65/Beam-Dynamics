opts = odeset('Reltol',1e-13,'AbsTol',1e-14,'Stats','on');
tspan = [0 10*pi];
y0 = [2 0 0 0.5];

[t,y] = ode113(@twobodyode, tspan, y0, opts);
plot(t,y)
legend('x','x''','y','y''','Location','SouthEast')
title('Position and Velocity Components')

figure
plot(y(:,1),y(:,3),'-o',0,0,'ro')
axis equal
title('Orbit of Smaller Mass')