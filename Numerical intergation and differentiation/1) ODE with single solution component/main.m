% 
% tspan = [0 5];
% y0 = 0;
% %[t,y] = ode45(@(t,y) 3*t, tspan, y0);
% %[t,y] = ode23(@(t,y) 2*t, tspan, y0);
% %[t,y] = ode113(@(t,y) 2*t, tspan, y0);
% plot(t,y,'-o')


% Compared to ode45, the ode23 solver is better at 
% solving problems with crude error tolerances. 
opts = odeset('Stats','on');
tspan = [0 2];
y0 = 1;
lambda = 1e3;
subplot(1,2,1)
disp('ode45 stats:')
tic, ode45(@(t,y) -lambda*y, tspan, y0, opts), toc
title('ode45')

subplot(1,2,2)
disp(' ')
disp('ode23 stats:')
tic, ode23(@(t,y) -lambda*y, tspan, y0, opts), toc
title('ode23')