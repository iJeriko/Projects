function [c,ceq] = constr1(x,p)
% The nonlinear equality and inequality constraints of the optimization problem are
% defined in this .m file. The inequality constraints are defined in the variable c while 
% the equality constraints are defined in the variable ceq. If there are no constraints in one 
% of the forms, either equality or inequality, then the corresponding variable, c or ceq respectively,
% is defined to be a empty matrix.

% NOTE : The inequality contraints have to be defined in the <= form.

% p=[rho,l,ymod, sigma_at,sigma_ac,a_l];
rho=p(1);
l=p(2);
ymod=p(3);
sigma_at=p(4);
sigma_ac=p(5);
a_l=p(6);
F=100e3;

ceq=[];

f1=zeros(10,1);
f1(6)=F;
[~,sigma1]=TrussAnalysis(x,ymod,l,f1);
c([1:13])=sigma1 - sigma_at*ones(13,1);
c([14:26])= sigma_ac*ones(13,1) - sigma1;

f2=zeros(10,1);
f2([2,4])=[F,F];
[~,sigma2]=TrussAnalysis(x,ymod,l,f2);
c([27:39])=sigma2 - sigma_at*ones(13,1);
c([40:52])= sigma_ac*ones(13,1) - sigma2;

f3=zeros(10,1);
f3([3,4,9,10])=[F,-2*F,F, -2*F];
[~,sigma3]=TrussAnalysis(x,ymod,l,f3);
c([53:65])=sigma3 - sigma_at*ones(13,1);
c([66:78])= sigma_ac*ones(13,1) - sigma3;
 