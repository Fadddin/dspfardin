clc;
clear all;
close all;
M=input('Enter the length of the filter: ');
wc = input('Enter the cutoff frequency: ')
y=hamming(M);
display('The hamming window coefficient are: ');
display(y);
hn=fir1(M-1,wc,y);
display('The sample response of FIR filter is:');
display(hn);
freqz(hn , 1 ,512);
grid on;
xlabel('normalised frequency');
ylabel('magnitude in dB');
title('Frequency response of FIR filters')
