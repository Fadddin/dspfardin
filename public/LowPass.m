clc;
clear all;
Ap = input("Enter the passband ripple in db: ");
As = input("Enter the stopband ripple in db: ");
omega_p = input("Enter the passband edge frequency in rad : ");
omega_s = input("Enter the stopband edge frequency in rad : ");
[n , omega_c] = butter(omega_p, omega_s, Ap, As, 's')
disp("The order is : ");
disp(n);
disp("The cutoff frequency is : ");
disp(omega_c);
fc = omega_c/ (2 * pi);
[num , den] = butter(n, omega_c , 'low', 's');
w = 0:200:500*pi;
h = freqz(num, den, w);
m = 20*log(abs(h));
subplot(2,1,1);
plot(w/2 * pi, m);
xlabel("frequency in Hz");
ylabel("magnitude in db");
title("Magniture response");
an = angle(h);
sublplot(2,1,2);
plot(w/2 * pi , an);
xlabel("frequency in Hz");
ylabel("phase");
title("phase response");
