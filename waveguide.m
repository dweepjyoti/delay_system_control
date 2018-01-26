clear all;
clc;
x=9.22:0.0001:14.47;
s=size(x);
y1=cot(0.14178*x);
y2=(-1)*1.6*cot(0.1354*x);
figure(1)
plot(x,y1,x,y2)
l=y1-y2;

for i=1:s(1,2)
    if ((l(1,i)<0.000001)&&(l(1,i)>-0.000001))
         k=i;
    end
end
theta=x(1,k)