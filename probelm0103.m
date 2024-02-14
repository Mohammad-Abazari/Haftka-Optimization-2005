clc;clear;close all;
clc; clear; close all; format compact;
myprob0103
function myprob0103
objf = @(x) 0.4*x(1)+0.2*x(2)-0.08+...
    (x(2)/2)/(0.1*x(2)^3/12+2*(x(1)-0.1)*(x(2)/2-0.1/2));
[x,fval] = fmincon(objf,[1,1],[],[],[],[],[0.1,0.1],[10,10])
end