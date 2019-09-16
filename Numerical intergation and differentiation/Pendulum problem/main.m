tspan = [0 100];
y0 = [1 0];
%opts = odeset('RelTol',1e-6,'AbsTol',1e-6);
[t,y] = ode45(@pendulum,tspan,y0);
figure(1)
plot(t,y(:,1),'-o',t,y(:,2),'-*')
errt = 0.5*(y(:,2).*y(:,2) - cos(y(:,1))) - 0.5*(y0(2)^2 - cos(y(1)));
figure(2)
plot(t,errt)