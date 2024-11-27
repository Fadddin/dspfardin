clc;
clear all;
n = input("Enter the range of the given signal : ");
x = input("Enter the given signal ");
N = input("Enter the length of the FFT sequence");
subplot(3,1,1);
stem(n,x);
title("Input signal");

xk = fft(x,N);
magxk = abs(xk);
anglexk = angle(xk);
k=0:N-1;
subplot(3,1,2);
stem(k,magxk);
title("magnitude of xk");
subplot(3,1,3);
stem(k,anglexk);
title("angle of xk");
display(xk);

