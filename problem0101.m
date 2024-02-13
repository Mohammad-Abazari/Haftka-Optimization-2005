clc;clear;close all;
clc; clear; close all; format compact;
addpath('D:\Engineering\Structures\Finite Elements\Finite Element MATLAB\06 Space Truss Element');
E = 30e6;
csp = [0,6,0; 6*[cosd(30),-sind(30)],0;6*[-cosd(30),-sind(30)],0;0,0,0];
bcs = [1:9]; P = zeros(12,1); P(end) = -25000;
ic = [1,4;2,4;3,4]; 


function minimize101(E,csp,bcs,P,ic)

[U,F,K,S] = spacetruss_solver(E,A,csp(:,1),csp(:,2),csp(:,3),P,ic,bcs)
objf = @(x) 3*pi*x(1)*sqrt(x(2)^2+6^2);
cons = @(x) []
end