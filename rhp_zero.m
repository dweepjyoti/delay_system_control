clear all;
clc;
s = tf('s'); % Intiaalizing as transfer function
% Parameters of the circuit
R = 9 ; % Load Resistance
L = 3e-3 ; % Inductance
Rl = 0.2 ; % Inductor resistance
c = 47e-6 ; % Capacitance of the converter
Rc = 5e-3 ; % Cacitance resistance
Vo = 20 ; % Output Specification voltage
Vi = 15 ; % Input rated voltage
d = 1 - (Vi/Vo) ; % Duty Cycle of switch
Il = 2 ; % Load Current nominal
k = (1-2*d)*Rc *c ;
k1 = Vo * (1-d) - Il * Rl ;
k2 = (1-d)^2 + Rl/R ;
gn = (1+k*s) * (k1 - Il * L * s)
gd = c * s * (L * s + Rl) + (1+k * s) * (k2 +(L*s/R))
g = zpk(gn/gd) % Plant model TF
%sisotool(g)
Gc=1; % Controller
% c = 10^3*(s+3)/(s*(s+10)*(s+1000));
vi_dist_tf=1/((1-d)+(L*s+Rl)*(c*s/(1+k*s)+1/R)/(1-d));
io_dist_tf=-((1+k*s)/(c*s))/(1+((1-d)^2/(L*s+Rl)+1/R)*(1+k*s)/(c*s));
optf = series(g,Gc)
figure(1)
bode(g)
figure(2)
bode(optf)
margin(optf)
cltf = feedback(optf,1)
figure(3)
step(cltf)
S=1/(1+optf)
%  T=optf/(1+optf) 
%  figure(4)
%  bode(S)
%  figure(5)
%  bode(T)