function [f] = obj1(x,p)
% The objective function, f, of the constrained nonlinear optimization problem 
% is defined here in terms of the variables, x1 and x2, which are the components
% x, i.e., x(1) = x1 and x(2) = x2.

% w is the vector of weights for the cost for each building

% NOTE : The optimization problem should be a minimization problem. If the optimization
% problem is cast as a maximization problem, it can be written as an equivalent minimization
% problem in the following way. max(f(x)) = -min(-f(x)).

% p=[rho,l,ymod, sigma_at,sigma_ac,a_l];
rho=p(1);
l=p(2);
ymod=p(3);
sigma_at=p(4);
sigma_ac=p(5);
a_l=p(6);

s2=sqrt(2);
L=l*ones(13,1);
L([2,4,5,7,8,10,11,13])=s2*l*ones(1,8);
L([3,9])=[2*l,2*l];


f=  rho* x' * L ;







