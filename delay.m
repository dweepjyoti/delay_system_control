J=1;
B=25;
K=100;
theta=0.02;
s=tf('s');
G=exp(-theta*s)*K/(J*s^2+B*s+K);
G_app=(1-theta/2*s)*K/((1+theta*s/2)*(J*s^2+B*s+K));
%C=50*(s+0.01)/(s+0.1)^2;
 C=6e4*(s+5)*(s+20)/(s*(s+600)*(s+500));
figure(1)
bode(G_app*C)
optf=C*G_app;
cltf=feedback(optf,1)
figure(2)
step(cltf)