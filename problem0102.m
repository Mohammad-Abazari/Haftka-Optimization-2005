clc;clear;close all;
clc; clear; close all; format compact;
myprob0102
function myprob0102
I = @(x) x(1)*x(2)^3/12;
E = 30e6; G = 12e6; % psi
sall = 75000; % psi 
l = 20*12; % ft
p = 10000; % lbs
objf = @(x) l*x(1)*x(2);
[X,FVAL,EXITFLAG,OUTPUT] = fmincon(objf,[1,20],[],[],[],[],[4,1],[100,100],@nlcons)
[X,FVAL,EXITFLAG,OUTPUT] = ga(objf,2,[],[],[],[],[4,1],[100,100],@nlcons)
nlcons(X)
FVAL/12^3*460*0.45
    function [c,ceq] = nlcons(x)
    pcr = 4.013*sqrt(E*I(x)*(0.312*x(2)*x(1)^3*G))/l^2;
    ceq = [];
    c = [(pcr*l/(x(2)/2))/sall-1;
         p*l/(x(2)/2)-1];
    end
end