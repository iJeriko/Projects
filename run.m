% This file contains the call to the constrained nonlinear optimization solver fmincon.
% NOTE : 1. For unconstrained nonlinear optimization problems use fminunc
%        2. For LP (linear programming) problems use linprog

clear all; clc;

% w is the vector of weights for the cost for each building
w=[1.75,1,1,1];

X0 = [0,0,0,0,0,0,0,0,0,0]; % Initial value for the variable 

A = []; B = [];  % Linear Inequality Constraints of the form A.x <= B
Aeq = []; Beq = [];  % Linear Equality Constraints of the form Aeq.x = Beq
LB = [-Inf;-Inf;-Inf;-Inf;-Inf;-Inf;-Inf;-Inf;-Inf;-Inf]; 
UB = [Inf;Inf;Inf;Inf;Inf;Inf;Inf;Inf;Inf;Inf];  % Bound Constraints of the form LB <= x <= UB

% OPTIONS = optimoptions(@fmincon,'Algorithm','interior-point','Diagnostics','on','Display','iter','GradObj','off');

OPTIONS = optimoptions(@fmincon,'Algorithm','active-set','Diagnostics','on','Display','iter','GradObj','off');


[xopt,fopt,EXITFLAG,OUTPUT,LAMBDA]=fmincon(@(x) obj(x,w),X0,A,B,Aeq,Beq,LB,UB,@constr,OPTIONS)

disp('   ');
disp('optimum design - xopt:');
disp(xopt);
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


% now, let us have some fun plotting the buildings and the optimum solution

plot(xopt(1:2:9),xopt(2:2:10),'MarkerFaceColor',[0.8471 0.1608 0],'Marker','o',...
    'LineStyle','none','MarkerSize',10,...
    'Color',[1 0 0]);
% xlim([0,10]); ylim([-5,7]); 
axis equal;
rectangle('Position',[2,-3,2,2],'FaceColor',[0.85,0.85,0.85]);
rectangle('Position',[6,-2,2,4],'FaceColor',[0.85,0.85,0.85]);
rectangle('Position',[8,4,2,2],'Curvature',[1,1],'FaceColor',[0.85,0.85,0.85]);
rectangle('Position',[-1,2,4,4],'Curvature',[1,1],'FaceColor',[0.85,0.85,0.85]);

text(0,4,'Building 1');
text(8.2,5,'Building 2');
text(2.2,-2,'Building 3');
text(6.2,0,'Building 4');

line([xopt(1),xopt(3)],[xopt(2),xopt(4)]);
line([xopt(1),xopt(5)],[xopt(2),xopt(6)]);
line([xopt(1),xopt(7)],[xopt(2),xopt(8)]);
line([xopt(1),xopt(9)],[xopt(2),xopt(10)]);



