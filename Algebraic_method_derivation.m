clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Objective: Repeat the result of the algebric method in paper: "3D Relative
%Pose Estimation from Distance-Only Measurements".
%Author: Ming Li
%Date: Feb./15/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k s t m n p q are the 
syms k_1 k_2 k_3 k_4 k_5 k_6 k_7 k_8 k_9 k_10 k_11 k_12 k_13 k_14 k_15 k_16 k_17
syms s_1 s_2 s_3 s_4 s_5 s_6 s_7 s_8 s_9 s_10 s_11 s_12 s_13 s_14 s_15 s_16 s_17
syms t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 t_10 t_11 t_12 t_13 t_14 t_15 t_16 t_17
syms m_1 m_2 m_3 m_4 m_5 m_6 m_7 m_8 m_9 m_10 m_11 m_12 m_13 m_14 m_15 m_16 m_17
syms n_1 n_2 n_3 n_4 n_5 n_6 n_7 n_8 n_9 n_10 n_11 n_12 n_13 n_14 n_15 n_16 n_17
syms h_1 h_2 h_3 h_4 h_5 h_6 h_7 h_8 h_9 h_10 h_11 h_12 h_13 h_14 h_15 h_16 h_17
syms g_1 g_2 g_3 g_4 g_5 g_6 g_7 g_8 g_9 g_10 g_11 g_12 g_13 g_14 g_15 g_16 g_17
k=[k_1 k_2 k_3 k_4 k_5 k_6 k_7 k_8 k_9 k_10 k_11 k_12 k_13 k_14 k_15 k_16 k_17];
s=[s_1 s_2 s_3 s_4 s_5 s_6 s_7 s_8 s_9 s_10 s_11 s_12 s_13 s_14 s_15 s_16 s_17];
t=[t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 t_10 t_11 t_12 t_13 t_14 t_15 t_16 t_17];
m=[m_1 m_2 m_3 m_4 m_5 m_6 m_7 m_8 m_9 m_10 m_11 m_12 m_13 m_14 m_15 m_16 m_17];
n=[n_1 n_2 n_3 n_4 n_5 n_6 n_7 n_8 n_9 n_10 n_11 n_12 n_13 n_14 n_15 n_16 n_17];
h=[h_1 h_2 h_3 h_4 h_5 h_6 h_7 h_8 h_9 h_10 h_11 h_12 h_13 h_14 h_15 h_16 h_17];
g=[g_1 g_2 g_3 g_4 g_5 g_6 g_7 g_8 g_9 g_10 g_11 g_12 g_13 g_14 g_15 g_16 g_17];

% Define all the coefficients to determine the linear combination  ---> x.
syms lambda_1 lambda_2 lambda_3 lambda_4 lambda_5 lambda_6 lambda_7
% According to what we have, apparently, yieding the following results.
% The last equation we have lambda_1*k_17+lambda_2*s_17+lambda_3*t_17+lambda_4*m_17+lambda_5*n_17+lambda_6*h_17+lambda_7*g_17=1;
% To simplify computation, we write 
lambda_7=(1-(lambda_1*k_17+lambda_2*s_17+lambda_3*t_17+lambda_4*m_17+lambda_5*n_17+lambda_6*h_17))/g_17;
q_11=lambda_1*k_1+lambda_2*s_1+lambda_3*t_1+lambda_4*m_1+lambda_5*n_1+lambda_6*h_1+lambda_7*g_1;
q_12=lambda_1*k_2+lambda_2*s_2+lambda_3*t_2+lambda_4*m_2+lambda_5*n_2+lambda_6*h_2+lambda_7*g_2;
q_13=lambda_1*k_3+lambda_2*s_3+lambda_3*t_3+lambda_4*m_3+lambda_5*n_3+lambda_6*h_3+lambda_7*g_3;
q_14=lambda_1*k_4+lambda_2*s_4+lambda_3*t_4+lambda_4*m_4+lambda_5*n_4+lambda_6*h_4+lambda_7*g_4;
q_22=lambda_1*k_5+lambda_2*s_5+lambda_3*t_5+lambda_4*m_5+lambda_5*n_5+lambda_6*h_5+lambda_7*g_5;
q_23=lambda_1*k_6+lambda_2*s_6+lambda_3*t_6+lambda_4*m_6+lambda_5*n_6+lambda_6*h_6+lambda_7*g_6;
q_24=lambda_1*k_7+lambda_2*s_7+lambda_3*t_7+lambda_4*m_7+lambda_5*n_7+lambda_6*h_7+lambda_7*g_7;
q_33=lambda_1*k_8+lambda_2*s_8+lambda_3*t_8+lambda_4*m_8+lambda_5*n_8+lambda_6*h_8+lambda_7*g_8;
q_34=lambda_1*k_9+lambda_2*s_9+lambda_3*t_9+lambda_4*m_9+lambda_5*n_9+lambda_6*h_9+lambda_7*g_9;
q_44=lambda_1*k_10+lambda_2*s_10+lambda_3*t_10+lambda_4*m_10+lambda_5*n_10+lambda_6*h_10+lambda_7*g_10;
r_1=lambda_1*k_11+lambda_2*s_11+lambda_3*t_11+lambda_4*m_11+lambda_5*n_11+lambda_6*h_11+lambda_7*g_11;
r_2=lambda_1*k_12+lambda_2*s_12+lambda_3*t_12+lambda_4*m_12+lambda_5*n_12+lambda_6*h_12+lambda_7*g_12;
r_3=lambda_1*k_13+lambda_2*s_13+lambda_3*t_13+lambda_4*m_13+lambda_5*n_13+lambda_6*h_13+lambda_7*g_13;
x=lambda_1*k_14+lambda_2*s_14+lambda_3*t_14+lambda_4*m_14+lambda_5*n_14+lambda_6*h_14+lambda_7*g_14;
y=lambda_1*k_15+lambda_2*s_15+lambda_3*t_15+lambda_4*m_15+lambda_5*n_15+lambda_6*h_15+lambda_7*g_15;
z=lambda_1*k_16+lambda_2*s_16+lambda_3*t_16+lambda_4*m_16+lambda_5*n_16+lambda_6*h_16+lambda_7*g_16;

%% Introduce the 27 constraints.
lambda_tilde=[lambda_1 lambda_2 lambda_3 lambda_4 lambda_5 lambda_6];
%Constraint 1
Constraint_1=q_11*q_44-q_14^2;
coefficients_1=collect(Constraint_1,lambda_tilde);
Beta(1,:)=coeffs(coefficients_1,lambda_tilde);


%Constraint 2
Constraint_2=q_22*q_44-q_24^2;
coefficients_2=collect(Constraint_2,lambda_tilde);
Beta(2,:)=coeffs(coefficients_2,lambda_tilde);


%Constraint 3
Constraint_3=q_33*q_44-q_34^2;
coefficients_3=collect(Constraint_3,lambda_tilde);
Beta(3,:)=coeffs(coefficients_3,lambda_tilde);


%Constraint 4
Constraint_4=q_11*q_22-q_12^2;
coefficients_4=collect(Constraint_4,lambda_tilde);
Beta(4,:)=coeffs(coefficients_4,lambda_tilde);

%Constraint 5
Constraint_5=q_22*q_33-q_23^2;
coefficients_5=collect(Constraint_5,lambda_tilde);
Beta(5,:)=coeffs(coefficients_5,lambda_tilde);

%Constraint 6
Constraint_6=q_33*q_11-q_13^2;
coefficients_6=collect(Constraint_6,lambda_tilde);
Beta(6,:)=coeffs(coefficients_6,lambda_tilde);

%Constraint 7
Constraint_7= q_14*q_24-q_12*q_44;
coefficients_7=collect(Constraint_7,lambda_tilde);
Beta(7,:)=coeffs(coefficients_7,lambda_tilde);

%Constraint 8
Constraint_8=  q_24*q_34-q_23*q_44;
coefficients_8=collect(Constraint_8,lambda_tilde);
Beta(8,:)=coeffs(coefficients_8,lambda_tilde);

%Constraint 9
Constraint_9= q_34*q_14-q_13*q_44;
coefficients_9=collect(Constraint_9,lambda_tilde);
Beta(9,:)=coeffs(coefficients_9,lambda_tilde);

%Constraint 10
Constraint_10= q_12*q_13-q_11*q_23;
coefficients_10=collect(Constraint_10,lambda_tilde);
Beta(10,:)=coeffs(coefficients_10,lambda_tilde);

%Constraint 11
Constraint_11=q_12*q_23-q_22*q_13;
coefficients_11=collect(Constraint_11,lambda_tilde);
Beta(11,:)=coeffs(coefficients_11,lambda_tilde);

%Constraint 12
Constraint_12=q_13*q_23-q_33*q_12;
coefficients_12=collect(Constraint_12,lambda_tilde);
Beta(12,:)=coeffs(coefficients_12,lambda_tilde);

%Constraint 13
Constraint_13=q_12*q_34-q_13*q_24;
coefficients_13=collect(Constraint_13,lambda_tilde);
Beta(13,:)=coeffs(coefficients_13,lambda_tilde);

%Constraint 14
Constraint_14=q_23*q_34-q_33*q_24;
coefficients_14=collect(Constraint_14,lambda_tilde);
Beta(14,:)=coeffs(coefficients_14,lambda_tilde);

%Constraint 15
Constraint_15=q_13*q_34-q_33*q_14;
coefficients_15=collect(Constraint_15,lambda_tilde);
Beta(15,:)=coeffs(coefficients_15,lambda_tilde);

%Constraint 16
Constraint_16=q_23*q_24-q_22*q_34;
coefficients_16=collect(Constraint_16,lambda_tilde);
Beta(16,:)=coeffs(coefficients_16,lambda_tilde);

%Constraint 17
Constraint_17=q_12*q_24-q_22*q_14;
coefficients_17=collect(Constraint_17,lambda_tilde);
Beta(17,:)=coeffs(coefficients_17,lambda_tilde);

%Constraint 18
Constraint_18=q_13*q_14-q_11*q_34;
coefficients_18=collect(Constraint_18,lambda_tilde);
Beta(18,:)=coeffs(coefficients_18,lambda_tilde);

%Constraint 19
Constraint_19=q_12*q_14-q_11*q_24;
coefficients_19=collect(Constraint_19,lambda_tilde);
Beta(19,:)=coeffs(coefficients_19,lambda_tilde);

%Constraint 20
Constraint_20=q_12*q_34-q_14*q_23;
coefficients_20=collect(Constraint_20,lambda_tilde);
Beta(20,:)=coeffs(coefficients_20,lambda_tilde);

%% Factors to formulate the following constraints
i=[1,5,9,2,4,3,7,6,8,1,5,9,6,8,3,7,1,5,9,2,4,1,5,9];
j=[1,1,1,2,2,3,3,4,4,5,5,5,6,6,7,7,8,8,8,9,9,10,10,10];
s=[1,-1,-1,2,2,2,2,2,-2,-1,1,-1,2,2,-2,2,-1,-1,1,2,-2,1,1,1];
G_sparse=full(sparse(i,j,s,9,10));
q_tilde=[q_11 q_12 q_13 q_14 q_22 q_23 q_24 q_33 q_34 q_44].';
p=[x,y,z].';
r=[r_1,r_2,r_3].';

%Constraint 21
Constraint_21=(G_sparse([1,2,3],:)*q_tilde).'*p-r_1;
coefficients_21=collect(Constraint_21,lambda_tilde);
Beta(21,:)=coeffs(coefficients_21,lambda_tilde);

%Constraint 22
Constraint_22=(G_sparse([4,5,6],:)*q_tilde).'*p-r_2;
coefficients_22=collect(Constraint_22,lambda_tilde);
Beta(22,:)=coeffs(coefficients_22,lambda_tilde);

%Constraint 23
Constraint_23=(G_sparse([7,8,9],:)*q_tilde).'*p-r_3;
coefficients_23=collect(Constraint_23,lambda_tilde);
Beta(23,:)=coeffs(coefficients_23,lambda_tilde);

%Constraint 24
Constraint_24=(G_sparse([1,4,7],:)*q_tilde).'*r-x;
coefficients_24=collect(Constraint_24,lambda_tilde);
Beta(24,:)=coeffs(coefficients_24,lambda_tilde);

%Constraint 25
Constraint_25=(G_sparse([2,5,8],:)*q_tilde).'*r-y;
coefficients_25=collect(Constraint_25,lambda_tilde);
Beta(25,:)=coeffs(coefficients_25,lambda_tilde);

%Constraint 26
Constraint_26=(G_sparse([3,6,9],:)*q_tilde).'*r-z;
coefficients_26=collect(Constraint_26,lambda_tilde);
Beta(26,:)=coeffs(coefficients_26,lambda_tilde);

%Constraint 26
syms d0
Constraint_27=p.'*p-d0^2;
coefficients_27=collect(Constraint_27,lambda_tilde);
Beta(27,:)=coeffs(coefficients_27,lambda_tilde);

save Beta Beta