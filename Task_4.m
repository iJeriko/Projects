% This file contains the call to the constrained nonlinear optimization solver fmincon.
% NOTE : 1. For unconstrained nonlinear optimization problems use fminunc
%        2. For LP (linear programming) problems use linprog

clear all; close all; clc;

% let us set up the parameters
rho=8000;
l=1.0;
ymod=2.1e11;
sigma_at=150e6;
sigma_ac=-100e6;
a_l=1e-4;
p=[rho,l,ymod, sigma_at,sigma_ac,a_l];


X0 = 1e-4*ones(13,1); % Initial value for the variable 

A = []; B = [];  % Linear Inequality Constraints of the form A.x <= B
Aeq = []; Beq = [];  % Linear Equality Constraints of the form Aeq.x = Beq
LB = a_l*ones(13,1); 
UB = Inf*ones(13,1);  % Bound Constraints of the form LB <= x <= UB

% OPTIONS = optimoptions(@fmincon,'Algorithm','interior-point','Diagnostics','on','Display','iter','GradObj','off');

OPTIONS = optimoptions(@fmincon,'Algorithm','active-set','Diagnostics','on','Display','iter','GradObj','off');


[xopt,fopt,EXITFLAG,OUTPUT,LAMBDA]=fmincon(@(x) obj1(x,p),X0,A,B,Aeq,Beq,LB,UB,@(x) constr2(x,p),OPTIONS)

disp('   ');
disp('optimum design - xopt, mm^2:');
disp(xopt*10^6);
disp('   ');
disp('optimum objective cost - fopt:');
disp(fopt);
disp('   ');
disp('multipliers of linear equalities are:');
lam_lin_in = getfield(LAMBDA,'ineqlin');
disp(lam_lin_in);
disp('   ');
disp('multipliers of nonlinear equalities are:');
lam_nonlin_in = getfield(LAMBDA,'ineqnonlin');
disp(lam_nonlin_in);





