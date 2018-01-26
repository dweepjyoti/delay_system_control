s =tf('s');
k = 5/(2000 * 59.4e-6);
lm = 0.3
r = 140;
g = (lm/r)*(s+k)%*(100000/(s+100000))
c = 100000/(s*(1+s/20000))
optf = series(g,c)
%bode(optf)
cltf = feedback(optf,1)
step(cltf);
