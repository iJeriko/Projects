function [f] = obj(x,w)
% The objective function, f, of the constrained nonlinear optimization problem 
% is defined here in terms of the variables, x1 and x2, which are the components
% x, i.e., x(1) = x1 and x(2) = x2.

% w is the vector of weights for the cost for each building

% NOTE : The optimization problem should be a minimization problem. If the optimization
% problem is cast as a maximization problem, it can be written as an equivalent minimization
% problem in the following way. max(f(x)) = -min(-f(x)).

% x0=x(1);
% y0=x(2);
% x1=x(3);
% y1=x(4);
% x2=x(5);
% y2=x(6);
% x3=x(7);
% y3=x(8);
% x4=x(9);
% y4=x(10);

xcoord=x(3:2:9);
ycoord=x(4:2:10);
x0=x(1);
y0=x(2);

f= sqrt((xcoord-x0).^2+ (ycoord-y0).^2)*w' ;






