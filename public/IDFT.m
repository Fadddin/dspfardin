k = input("Enter the Range of x(n)");
x = input("Enter the Value of x(n)");
N = length(x);
W = exp(i*2*pi/N);

for n = 1:N
  xn(n) = 0;
  for j = 1:N
    xn(n) = xn(n) + x(j) * W^((n-1)*(j-1));

 end
 xn(n) = xn(n) / N;
end

p = abs(xn);
subplot(2,1,1);
stem(k, x);
grid on;
xlabel("k");
ylabel("x");

subplot(2,1,2);
stem(k, p);
grid on;
xlabel("k");
ylabel("p");
