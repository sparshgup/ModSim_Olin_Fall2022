function [S, E, I, R, D, W] = simulate_seird(s_0, e_0, i_0, r_0, d_0, alpha, beta, gamma, delta, sigma, num_steps)
% Simulate a SEIRD model
%
% Usage
%   [S, E, I, R, D, W] = simulate_seird(s_0, e_0, i_0, r_0, d_0, alpha, beta, gamma, delta, sigma, num_steps)
%
% Arguments
%   s_0 = initial number of susceptible individuals
%   e_0 = initial number of exposed individuals 
%   i_0 = initial number of infected individuals
%   r_0 = initial number of recovered individuals
%   d_0 = initial number of dead individuals
%
%   alpha = infection rate parameter
%   beta  = exposure rate parameter
%   gamma = recovery rate paramter
%   delta = death rate parameter
%   sigma = re-susceptible rate parameter
%
%   num_steps = number of simulation steps to simulate
%
% Returns
%   S = simulation history of susceptible individuals; vector
%   E = simulation history of exposed individuals; vector
%   I = simulation history of infected individuals; vector
%   R = simulation history of recovered individuals; vector
%   D = simulation history of dead individuals; vector
%   W = simulation week; vector

% Setup
S = zeros(1, num_steps); S(1) = s_0;
E = zeros(1, num_steps); E(1) = e_0;
I = zeros(1, num_steps); I(1) = i_0;
R = zeros(1, num_steps); R(1) = r_0;
D = zeros(1, num_steps); D(1) = d_0;
W = 1 : num_steps;

% Run simulation
for step = 1 : (num_steps - 1)
    [S(step+1), E(step+1), I(step+1), R(step+1), D(step+1)] = action_seird(S(step), E(step), I(step), R(step), D(step), alpha, beta, gamma, delta, sigma);
end

end