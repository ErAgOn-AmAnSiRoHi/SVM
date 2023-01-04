clc;clear all;close all;

disp("Proximal SVM");

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
    om=(((w'*w)+(g^2))/2)+(c/2*(ep'*ep))
    cont=D*((A*w)-(g.*e))+ep
    minimize om
   
    subject to 
        cont == e
cvx_end
w 
g
ep
x=[100;100];
s=sign((w'*x)-g)

if s==0
    disp("class is one ")
else
    disp("class is zero ")
end
