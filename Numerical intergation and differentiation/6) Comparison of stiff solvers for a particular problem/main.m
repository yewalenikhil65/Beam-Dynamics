lambda = 1e9;
y0 = 1;
tspan = [0 0.5];
opts = odeset('Jacobian',-lambda,'Stats','on');
subplot(2,2,1)
tic, ode15s(@(t,y) -lambda*y, tspan, y0, opts), toc
title('ode15s')

subplot(2,2,2)
tic, ode23s(@(t,y) -lambda*y, tspan, y0, opts), toc
title('ode23s')

subplot(2,2,3)
tic, ode23t(@(t,y) -lambda*y, tspan, y0, opts), toc
title('ode23t')

subplot(2,2,4)
tic, ode23tb(@(t,y) -lambda*y, tspan, y0, opts), toc
title('ode23tb')