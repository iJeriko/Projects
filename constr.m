function [c,ceq] = constr(x)
% The nonlinear equality and inequality constraints of the optimization problem are
% defined in this .m file. The inequality constraints are defined in the variable c while 
% the equality constraints are defined in the variable ceq. If there are no constraints in one 
% of the forms, either equality or inequality, then the corresponding variable, c or ceq respectively,
% is defined to be a empty matrix.

% NOTE : The inequality contraints have to be defined in the <= form.

xcoord=x(3:2:9);
ycoord=x(4:2:10);

ceq=[];

c(1)=(xcoord(1) - 1)^2 + (ycoord(1) - 4)^2 - 4;
c(2)=(xcoord(2) - 9)^2 + (ycoord(2) - 5)^2 - 1;
c(3)=xcoord(3) - 4;
c(4)=2 - xcoord(3);
c(5)=ycoord(3)+1;
c(6)=-3 - ycoord(3);
c(7)=xcoord(4)-8;
c(8)=6-xcoord(4);
c(9)=ycoord(4)-2;
c(10)=-2-ycoord(4);
 