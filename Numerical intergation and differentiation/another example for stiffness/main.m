delta = 0.001;
F = inline('y^2 - y^3','t','y');
opts = odeset('RelTol',1.e-4);
ode23s(F,[0 2/delta],delta,opts);  % try stiff solvers like ode23s etc instead for smaller delta