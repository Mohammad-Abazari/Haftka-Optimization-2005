clc;clear;close all;
clc; clear; close all; format compact;
% addpath('D:\Engineering\Structures\Finite Elements\Finite Element MATLAB\06 Space Truss Element');
addpath('C:\Users\mohab\Documents\Engineering\Structures\Finite Elements\Finite Element MATLAB\06 Space Truss Element');
myp0101
function myp0101
% known
E = 30e6; sall = 60e3;
r = 6;
bcs = 1:9; P = zeros(12,1); P(end) = -25e3;
ic = [1,4;2,4;3,4];

objf = @(x) 3*pi*x(1)*0.2*sqrt(x(2)^2+(r*12)^2);
[X,FVAL,EXITFLAG,OUTPUT] = fmincon(objf,[3,12],[],[],[],[],[2,0],[1000,1000],@cons)
cons(X)
csp = [0, r*12, -X(2);
    r*[cosd(30),-sind(30)]*12,-X(2);
    r*[-cosd(30),-sind(30)]*12,-X(2);
    0,0,0];
[U,~,~,S] = spacetruss_solver(E*ones(1,3),X(1)*pi*0.2*ones(1,3),csp(:,1),csp(:,2),csp(:,3),P,ic,bcs)
        draw_space_truss(csp,ic,U*100)
    function [c,ceq] = cons(x)
        % Analysis
        csp = [0, r*12, -x(2);
            r*[cosd(30),-sind(30)]*12,-x(2);
            r*[-cosd(30),-sind(30)]*12,-x(2);
            0,0,0];
        [~,~,~,S] = spacetruss_solver(E*ones(1,3),x(1)*pi*0.2*ones(1,3),csp(:,1),csp(:,2),csp(:,3),P,ic,bcs);
        % draw_space_truss(csp,ic,U*100)
        ceq = [];
        c(1) = (36e6*0.2/x(1))/sall-1;
        c(2) = max(abs(S))/sall-1;
    end
end