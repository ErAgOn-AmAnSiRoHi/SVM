clc;clear all;close all;
 
x = rand(2000,1)*5;
y = rand(2000,1)*5;

c = mod((floor(x)+floor(y)),2);

ind = find(c);
a = [x(ind),y(ind)];
 
ind1 = find(c==0);
b = [x(ind1),y(ind1)];
 
figure(1)
plot(a(:,1),a(:,2),'*');hold on
plot(b(:,1),b(:,2),'o','Color','red');hold off;title('Checkboard data')

