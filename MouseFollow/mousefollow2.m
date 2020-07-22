close all
clear

K = [10 10];
G = 0.25;

S = get(0,'screensize');
F = figure('position',round([0.1*S(3:4) 0.8*S(3:4)]),'menubar','none');
H = plot(0,0);

Xo = round((S(3)+1i*S(4))/2);
Zo = 0+1i;
Xc2 = [0 0];

while isvalid(F)
    
    T = tic;
    
    delete(H)
    H = plotrobo(Xo,Zo);
    
    Xf = sum(get(0,'PointerLocation') .* [1 1i]);
    Xtil = abs(Xf-Xo);
    Ztil = angle(Xf-Xo) - angle(Zo);
    
    Xc1 = sign(cos(Ztil)) * [tanh(0.01*Xtil) sin(Ztil)];
    Xc2 = Xc2 + tanh(G*(Xc1-Xc2));
    
    Xd = K .* Xc2;
    
    Xo = Xo + Xd(1)*Zo*(cos(pi/360*Xd(2))+1i*sin(pi/360*Xd(2)));
    Zo = Zo*(cos(pi/180*Xd(2))+1i*sin(pi/180*Xd(2)));
    
    pause(0.1-toc(T))
    
end