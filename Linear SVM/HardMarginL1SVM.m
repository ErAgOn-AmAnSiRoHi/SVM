clc; clear all; close all;

d_val = [-1;-1;-1;1;1;1];
d = diag(d_val)
A = [1 2;2 1;2 2;3 3;3 4;4 3]
e = ones(6,1)

cvx_begin
    variables w(2) g
    minimize((w'*w)/2)
    subject to
    d*(A*w - g*e) >= 1
cvx_end

w
g

x=[0;0];
s=sign((w'*x)-g)

if s==1
    disp("class is one ")
else
    disp("class is zero ")
end
