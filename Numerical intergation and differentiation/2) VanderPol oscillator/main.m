% tspan =[0 3000]; y0 =[2 0];
% [t,y] = ode45(@vdp1000,tspan,y0);  % or ode23 or ode113
% %sol = ode45(@vdp1000,tspan,y0);
% plot(t,y(:,1),'-o',t,y(:,2),'-o')
% %x = linspace(0,20,250);
% %y = deval(sol,x);
% %plot(x,y(1,:))
% % sol_new = odextend(sol,@vdp1000,35);
% % x = linspace(20,35,350);
% % y = deval(sol_new,x);
% % hold on
% % plot(x,y(1,:),'r')
% title('Solution of van der Pol Equation (\mu = 1) with ODE45');
% xlabel('Time t');
% ylabel('Solution y');
% legend('y_1','y_2')


%% for stiff solver ode15s
[t,y] = ode15s(@vdp1000,[0 3000],[2 0]);   % or ode23s or ode23t or ode23 or ode23tb
plot(t,y(:,1),'-o')
%extending the solution using odextend and deval
x = linspace(0,3000,2500);
y = deval(sol,x,1);
plot(x,y)