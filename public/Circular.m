clc;
clear all;
close all;
x = input("Enter X(n)");
h = input("Enter h(n)");
N = length(x);
W = exp((-2*pi*1i)/N);

for k=1:N
  X(k)=0;
  H(k)=0;

  for j=1:N
    X(k)=x(j)*W^((j-1)*(k-1))+X(k);
    H(k) =h(j)*W^((j-1)*(k-1))+H(k);
    Y(k)=X(k)*H(k);
  end
end

for m=1:N
  y(m)=0;
  for k=1:N
    y(m)=y(m)+Y(k)*W^(-(m-1)*(k-1));
    end
  y(m)=y(m)/N;
end
disp('X=');
disp(X);
disp('H=');
disp(H);
disp('Y=');
disp(Y);
disp('y=');
disp(y);

subplot(3,2,1);
stem(1:N,X);
title("DFT of Signal 1");

subplot(3,2,2);
stem(1:N,H);
title("DFT of Signal 2");

subplot(3,2,3);
stem(1:N,Y);
title("Multiplication in frequency domain");

subplot(3,2,4);
stem(1:N,y);
title("Circular Convulation in time domain");
