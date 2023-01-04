clc; clear all; close all;

disp("Non-Linear SVM using RBF Kernel _ Primal");
    
%DataSet
x = rand(2000,1)*5;
y = rand(2000,1)*5;
c = mod((floor(x)+floor(y)),2);
ind = find(c);
a = [x(ind),y(ind)]
 
ind1 = find(c==0);
b = [x(ind1),y(ind1)]
 
A=[a;b];
X = A(:,1)
Y = A(:,2)




size1=size(X);
size2=size(Y);


G = sum((X.*X),2);
H = sum((Y.*Y),2);

Q = repmat(G,1,size2(1));
R = repmat(H',size1(1),1);

H = Q + R - 2*X*Y';


H=exp(-H/2/1^2)



% Define the constraints
% G = [-diag(y) * K, -eye(n)];
G = diag([-1.*ones(length(a),1);1.*ones(length(b),1)])
d = [-1.*ones(length(a),1);1.*ones(length(b),1)]
% h = -ones(n, 1);

P = H .* (G * G')
q = ones(2000,1)
c = 1.2
% Solve the optimization problem
cvx_begin
    % Define the optimization variables
    variables w(2000) epsi(2000) g(1)
    % Define the objective function
    objective = ((( w' * w )/2)+sum((c * epsi)))
    cont = (G*(H * w - (g.*q)) + epsi - q)
    minimize(objective)
    subject to
        cont >= 0
        epsi >= 0
cvx_end

w 
g
x=[.5,1.5];
Knew = exp(-g * pdist2(x,A).^2);
s = sign(Knew*w - g)

if s==1
    disp("class is one ")
else
    disp("class is zero ")
end
