function [s_n, e_n, i_n, r_n, d_n] = action_seird(s, e, i, r, d, alpha, beta, gamma, delta, sigma)
% Advance an SEIRD model one timestep
%
% Usage
%   [s_n, e_n, i_n, r_n, d_n] = action_seird(s, e, i, r, d, alpha, beta, gamma, delta, sigma)
% 
% Arguments
%   s = current number of susceptible individuals
%   e = current number of exposed individuals
%   i = current number of infected individuals
%   r = current number of recovered individuals
%   d = current number of death individuals
%
%   alpha = infection rate parameter
%   beta  = exposure rate parameter
%   gamma = recovery rate paramter
%   delta = death rate parameter
%   sigma = re-susceptible rate parameter
% 
% Returns
%   s_n = next number of susceptible individuals
%   e_n = next number of exposed individuals
%   i_n = next number of infected individuals
%   r_n = next number of recovered individuals
%   d_n = next number of dead individuals


% compute new infections and recoveries
susceptible = min(sigma*r,r);
exposed     = min(beta * i * s,s);
infectious  = min(alpha * e,e);
recovered   = min(gamma * i,i);
dead        = min(delta*i,i);
    
% Update state
s_n = s - exposed     + susceptible;
e_n = e - infectious  + exposed;
i_n = i - recovered   - dead        + infectious;
r_n = r - susceptible + recovered;
d_n = d + dead;

% Enforce invariants; necessary since we're doing a discrete approx.
s_n = max(s_n, 0);
e_n = max(e_n, 0);
i_n = max(i_n, 0);
r_n = max(r_n, 0);
d_n = max(d_n, 0);
    
end