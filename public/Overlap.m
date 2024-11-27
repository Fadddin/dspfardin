x=input("x= ");
h=input("h= ");
L=4;
n1=0:length(x)-1;
subplot(2,2,1); stem(n1,x);
title("Given Signal");
n2=0:length(h)-1;
subplot(2,2,2); stem(n2,h);
title("Impulse Signal");
M=length(h);
N=L+M-1;
lx=length(x);
r=rem(lx,L);
if r~=0
  x1=[x zeroes(1,L-r)];
else
  x1=x;
end
nr=length(x1)/L;
h1=[h zeros(1,L-1)];
Ma=zeros(nr,L);
Ma1=zeros(nr,N);
Ma2=zeros(nr,N);
for k=1:nr
  Ma(k,:)=x1(((k-1)*L+1):k*L);
  if k==1
    Ma1(k,:)=[zeros(1,M-1) Ma(k,:)];
  else
  Ma1(k,:)=[Ma(k-1, (L-M+2):L) Ma(k,:)];
end
Ma2(k,:)=functionCirle(Ma1(k,:),h1);
end
Ma3=Ma2(:,M:N);
y1=Ma3;
y=y1(:);
n3=0:length(y)-1;
subplot(2,2,3:4);
stem(n3,real(y));
axis([min(n3)-1 max(n3)+1 min(real(y))-1 max(real(y))+1]);
title('Convoluted Signal');
