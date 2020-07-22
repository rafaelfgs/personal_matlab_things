close all
clear

K = [10 10];

S = get(0,'screensize');
F = figure('position',round([0.1*S(3:4) 0.8*S(3:4)]),'menubar','none');
H = plot(0,0);

Xo = round((S(3)+1i*S(4))/2);
Zo = 0+1i;
Xc = [0 0];

while isvalid(F)
    
    T = tic;
    
    delete(H)
    H = plotrobo(Xo,Zo);
    
    Xf = sum(get(0,'PointerLocation') .* [1 1i]);
    Xtil = abs(Xf-Xo);
    Ztil = angle(Xf-Xo) - angle(Zo);
    disp([Xtil Ztil]);
  
    Xc = sign(Ztil) * [tanh(0.01*abs(Xtil)) sin(Ztil)];
%     Xc = sign(cos(angle(Xtil)-angle(Zo))) * ...
%          [tanh(0.01*abs(Xtil)) sin(angle(Xtil)-angle(Zo))];
%     Xc = tanh(0.01*[abs(Xtil) abs(Ztil)]);
      Xd = K .* Xc;
    
    Xo = Xo + Xd(1)*Zo*(cos(pi/360*Xd(2))+1i*sin(pi/360*Xd(2)));
    Zo = Zo*(cos(pi/180*Xd(2))+1i*sin(pi/180*Xd(2)));
    
    pause(0.1-toc(T))
    
end