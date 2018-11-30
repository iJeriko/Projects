function [ u,sigma] = TrussAnalysis( a,ymod,l,f)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s2=sqrt(2);
L=l*ones(13,1);
L([2,4,5,7,8,10,11,13])=s2*l*ones(1,8);
L([3,9])=[2*l,2*l];

Btran=zeros(10,13);
Btran(1,[1,2,4,8,10])=[1,1/s2,-1/s2,1/s2,-1/s2];
Btran(2,[2,4,8,10])=[-1/s2,-1/s2,1/s2,1/s2];
Btran(3,[5,6,7])=[-1/s2,1,1/s2];
Btran(4,[5,7])=[1/s2,1/s2];
Btran(5,[3,4,5])=[1,1/s2,1/s2];
Btran(6,[4,5])=[1/s2,-1/s2];
Btran(7,[11,12,13])=[-1/s2,1,1/s2];
Btran(8,[11,13])=[-1/s2,-1/s2];
Btran(9,[9,10,11])=[1,1/s2,1/s2];
Btran(10,[10,11])= [-1/s2,1/s2];

D=diag(ymod* (a./L));
K=Btran*D*Btran';

u=K\f;

S=zeros(13,10);
S(1,1)= (ymod/L(1))*1;
S(2,[1,2])= (ymod/L(2))*[1/s2,-1/s2];
S(3,5)= (ymod/L(3))*1;
S(4,[1,2,5,6])= (ymod/L(4))*[-1/s2,-1/s2,1/s2,1/s2];
S(5,[3,4,5,6])= (ymod/L(5))*[-1/s2,1/s2,1/s2,-1/s2];
S(6,3)= (ymod/L(6))*1;
S(7,[3,4])= (ymod/L(7))*[1/s2,1/s2];
S(8,[1,2])= (ymod/L(8))*[1/s2,1/s2];
S(9,9)= (ymod/L(9))*1;
S(10,[1,2,9,10])= (ymod/L(10))*[-1/s2,1/s2,1/s2,-1/s2];
S(11,[7,8,9,10])= (ymod/L(11))*[-1/s2,-1/s2,1/s2,1/s2];
S(12,7)= (ymod/L(12))*1;
S(13,[7,8])= (ymod/L(13))*[1/s2,-1/s2];

sigma=S*u;

end

