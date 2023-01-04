clc;clear all;close all;

disp("Linear Soft Margin L2 SVM");

x = rand(2000,1)*5;
y = rand(2000,1)*5;
c = mod((floor(x)+floor(y)),2);
ind = find(c);
a = [x(ind),y(ind)]
 
ind1 = find(c==0);
b = [x(ind1),y(ind1)]
 
A=[a;b];


D =diag([-1.*ones(length(a),1);1.*ones(length(b),1)])

e = ones(length(A),1)

c=1.2 
cvx_begin
    variable w(2)
    variable g(1)
    variable ep(length(A)) 
    om=((w'*w)/2)+(c/2*(ep'*ep))
    cont=D*((A*w)-(g.*e))+ep
    minimize om
   
    subject to 
        cont == e
cvx_end
w 
g
ep
x=[6;6];
s=sign((w'*x)-g)

if s==1
    disp("class is one ")
else
    disp("class is zero ")
end
