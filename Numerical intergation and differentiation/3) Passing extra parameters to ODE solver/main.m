A = 1;
B = 2;
tspan = [0 5];
y0 = [0 0.01];
[t,y] = ode45(@(t,y) odefcn(t,y,A,B), tspan, y0);  %or ode23 or ode 113 or ode15s or ode23s or ode23t or ode23tb
plot(t,y(:,1),'-o',t,y(:,2),'-.')
