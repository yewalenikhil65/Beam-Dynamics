tspan = [0 321.8122];
y0 = [1 0 0 0 0 0 0 0.0057];
[t,y] = ode15s(@hires,tspan,y0);
for i = 1:length(t)
    h = t(i+1) - t(i);
    plot(t(i),log(h),'-o');
    hold on
end