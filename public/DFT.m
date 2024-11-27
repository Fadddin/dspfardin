clc;
clear all;
close all;
N=input("Enter the Range of x(n)");
x=input("Enter the Value of x(n)");
n=length(N);
W=exp(-2*i*pi/n);

for k= 1:n
  x_k(k) = 0;
  for j=1:n
    x_k(k) = x(j) * W^((j-1)*(k-1)) + x_k(k);
end
end
p=abs(x_k);
subplot(2,1,1);
stem(N,x);
grid on;
xlabel("N");
ylabel("x");
subplot(2,1,2);
stem(N,x_k);
grid on;
xlabel("N");
ylabel("x_k");
