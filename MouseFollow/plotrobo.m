function H = plotrobo(Xo,Zo)

try delete(H),catch,end

L = get(gcf,'position');
set(gca,'position',[0.05 0.05 0.9 0.9])
set(gca,'units','pixels')
L = [L(1:2) 0 0] + get(gca,'position');
set(gca,'units','normalized')

a = round(min(L(3:4))/50);
b = a/2;
c = b/3;

V1x = real(Xo) + [a*sqrt(2)*cos(angle(Zo)+1*pi/4) ...
                  a*sqrt(2)*cos(angle(Zo)+3*pi/4) ...
                  a*sqrt(2)*cos(angle(Zo)+5*pi/4) ...
                  a*sqrt(2)*cos(angle(Zo)+7*pi/4)];
V1y = imag(Xo) + [a*sqrt(2)*sin(angle(Zo)+1*pi/4) ...
                  a*sqrt(2)*sin(angle(Zo)+3*pi/4) ...
                  a*sqrt(2)*sin(angle(Zo)+5*pi/4) ...
                  a*sqrt(2)*sin(angle(Zo)+7*pi/4)];

V2x = real(Xo) + [sqrt(a^2+b^2+c^2-2*a*c)*cos(angle(Zo)+pi/2-atan(b/(a-c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*cos(angle(Zo)+pi/2-atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*cos(angle(Zo)+pi/2+atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2-2*a*c)*cos(angle(Zo)+pi/2+atan(b/(a-c)))];
V2y = imag(Xo) + [sqrt(a^2+b^2+c^2-2*a*c)*sin(angle(Zo)+pi/2-atan(b/(a-c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*sin(angle(Zo)+pi/2-atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*sin(angle(Zo)+pi/2+atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2-2*a*c)*sin(angle(Zo)+pi/2+atan(b/(a-c)))];

V3x = real(Xo) + [sqrt(a^2+b^2+c^2-2*a*c)*cos(angle(Zo)-pi/2-atan(b/(a-c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*cos(angle(Zo)-pi/2-atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*cos(angle(Zo)-pi/2+atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2-2*a*c)*cos(angle(Zo)-pi/2+atan(b/(a-c)))];
V3y = imag(Xo) + [sqrt(a^2+b^2+c^2-2*a*c)*sin(angle(Zo)-pi/2-atan(b/(a-c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*sin(angle(Zo)-pi/2-atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2+2*a*c)*sin(angle(Zo)-pi/2+atan(b/(a+c)))...
                  sqrt(a^2+b^2+c^2-2*a*c)*sin(angle(Zo)-pi/2+atan(b/(a-c)))];

H = patch([V1x' V2x' V3x'],[V1y' V2y' V3y'],[1;0;0]);
colormap([0 0 0;0 1 1])

set(gca,'xlim',[L(1) L(1)+L(3)],'ylim',[L(2) L(2)+L(4)],'xtick',[],'ytick',[])

end