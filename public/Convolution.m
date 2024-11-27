clc;
clear all;
close all;
xn = input('Enter the range of x(n)');
hn = input('Enter the range of h(n)');
x = input ('Enter the value of x(n)');
h = input ('Enter the value of h(n)');
l = length(x);
m = length(h);
yn = min(xn)+ min(hn):max(xn)+ max(hn);
k= length(yn);
y = zeros (1,k);
for i = 1:k;
for j = 1:l;
p =i-j+1;
if ((p>0) && (p<m+1));
  y(1,i) = y(1,i)+ x(1,j)*h(1,p);
end
end
end
display('output of the linear convolution');
y
subplot( 3,1,1);
stem(xn,x);
grid on;
title('plot of x(n)');
subplot(3,1,2);
stem(hn,h);
grid on;
title('plot of h(n)');
subplot(3,1,3);
stem (yn,y);
grid on;
title('plot of y(n)');
