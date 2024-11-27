clc;
clear all;
n=-5:1:5;
u=[zeros(1,5),ones(1,6)];
subplot(4,2,1);
stem(n,u);
grid on;
xlabel("n");
ylabel("u(n)");
title("Step Signal")
%code for ramp
r=n.*u;
subplot(4,2,2);
stem(n,r);
grid on;
xlabel("n");
ylabel("r(n)");
title("Ramp Signal");
%code for impulse
d=[zeros(1,5),1,zeros(1,5)];
subplot(4,2,3);
stem(n,d);
xlabel("n");
ylabel("d(n)");
title("Impulse Signal");
%code for sine
s=sin(n);
subplot(4,2,4);
stem(n,s);
xlabel("n");
ylabel("sin(n)");
title("Sine Signal");
%code for cosine
c=cos(n);
subplot(4,2,5);
stem(n,c);
xlabel("n");
ylabel("cos(n)");
title("Cosine Signal");
%code for exponential
y=exp(n);
subplot(4,2,6);
stem(n,y);
xlabel("n");
ylabel("exp(n)");
title("exponential Signal");
