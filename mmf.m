function [mu,nu,sigma] = mmf(T,mu_t,df,sigma_t, rep)
% T = 100; % sample points
% P = 1000; % steps
% mu_t = [0;0]; % scale points
% df = 4; % degree of freedom
% sigma_t = eye(2); % covariance matrix / correlation matrix
X = sample(T,mu_t,df,sigma_t);
% X = mu_t + scale _t .* mvtrnd(sigma_t, df, n);
w = 1/T.*ones(1,T); % weights
[mu,nu,sigma] = iterate_studentT(X,w,'MMF',rep);

% [mu,nu,sigma] = mmf(1000,0,4,eye(1),500)

    

% INPUTS of iterate_studentT
% X  - d x n array containing the samples
% w  - 1 x n array containing the weights of the samples
% step_algorithm - 'MMF' the function performs the MMF.
% anz_steps - Maximum number of iterations

% OUTPUTS of iterate_studentT
% mu,nu,sigma    - estimated parameters
% num_steps      - if stop==1 then num_steps contains the number of
%                  steps, until the stopping criteria is reached.
%                  Otherwise NaN is returned.
% time           - execution time of the algorithm
% objective      - if save_obj==1, objective(r) contains the negative
%                  log-likelihood value of nu_r,mu_r,Sigma_r.
%                  Otherwise objective(r)=0.