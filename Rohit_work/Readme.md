1) Code for linear damped Euler-bernoulli beam (uncontrolled)

- Install `Julia 1.6` from https://julialang.org/downloads/
- Important packages to be imported
- `] add DifferentialEquations`
- `] add Plots`
- Precompile the packages as following, this should take a little time for the first time
- `using DifferentialEquations, Plots`

```julia
# importing IMP packages..blah..blah..blah
using DifferentialEquations
using LinearAlgebra
using SparseArrays
## some parameters
EI = 291.6667; # stiffness ..thing
m = 1.3850;     # mass per length..thing
L = 5.0;        # length of beam
c = 0.01*2*m*π*π*sqrt(EI/(m*L^4));    # 1% of critical damping
p = 1.0;        # some parameter in deflection

## Space domain and grids
Δx = 0.05;             x = 0.0:Δx:L;
tspan = (0.f0,10.f0);
x_nonBC = x[2]:Δx:x[end-1]  # on which u solve EOMs..internal nodes
n = length(x_nonBC)

## ∂⁴u/∂x⁴ discretized.. returns a matrix
# BCs are already applied in it
function ∂⁴u_∂x⁴(n)
    # Unfortunately this is not an automatic version of
    # creating linear operator matrices from derivatives
    k = spzeros(Float32,n,n)
    k[diagind(k)] .= 6.0
    k[1] = 5.0;   k[end] = 5.0;

    k[diagind(k,2)] .= 1.0
    k[diagind(k,1)] .= -4.0
    k[diagind(k,-1)] .= -4.0
    k[diagind(k,-2)] .= 1.0

    K = (EI/(Δx^4))*k;
    return K
end

mK = -∂⁴u_∂x⁴(n)/m;
mC = -spdiagm(0 => (c)*ones(n))/m

A = Float32[zeros(n,n) I(n);
                    mK mC];

## State-space system
function dudt(u,p,t)
    return A*u;
end
## initial profile at t= 0 => gives initial cond. of State-space system
u0(x) = (p*x*(x^3 + L^3 - 2*L*x^2)/(24*EI))  # initial displacement profile as a function
x0 = Float32[u0.(x_nonBC); zeros(n)]  # initial condition = [initial_displacement; initial velocity]
oprob = ODEProblem(dudt, x0, tspan)   # set up an ODEProblem, arguments -> function_name, initial_condition, time-span
sol = solve(oprob, DP5() ,saveat=0.5 ) # solve the ODEProblem using DP5() algorithm(same as ode15 in MATLAB), and save the results at every 0.5 s.

sol_u = Array(sol)[1:n,:]; #displacement
sol_v = Array(sol)[n+1:end,:];

using Plots
gr()
surface(sol.t, x_nonBC, sol_u)


```
