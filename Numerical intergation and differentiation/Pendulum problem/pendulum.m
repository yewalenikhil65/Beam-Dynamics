function f = pendulum(t,y)
f= zeros(2,1);
f(1) = y(2);
f(2) = -sin(y(1));
end