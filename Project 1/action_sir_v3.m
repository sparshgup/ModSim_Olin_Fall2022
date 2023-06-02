function [s_n, i_n, r_n] = action_sir_v3(s, i, r, beta, gamma, delta)
% Advance an SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n] = action_sir(s, i, r, beta, gamma)
% 
% Arguments
%   s = current number of susceptible individuals
%   i = current number of infected individuals
%   r = current number of recovered individuals
%   
%   beta  = infection rate parameter
%   gamma = recovery rate paramter
%   delta = re-susceptible parameter
% 
% Returns
%   s_n = next number of susceptible individuals
%   i_n = next number of infected individuals
%   r_n = next number of recovered individuals

% compute new infections and recoveries
infected = min(beta * i * s,s);
recovered = min(gamma * i,i);
resusceptible = min(delta*r,r);
    
% Update state
s_n = s - infected + resusceptible;
i_n = i + infected - recovered;
r_n = r + recovered - resusceptible;

% Enforce invariants; necessary since we're doing a discrete approx.
s_n = max(s_n, 0);
i_n = max(i_n, 0);
r_n = max(r_n, 0);
    
end