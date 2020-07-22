%% Begining

clc
clear
close all

%% Input

[x,fs] = audioread('D:\hubiC\Documentos\Guitar Pro\Ready\Top Gear\Top Gear Original.mp3');
cut = [0.5 6.7];
speed = 0.5;
tone = -3/2;
freq = 30;

%% Variables

n = round(fs/freq);
tone = 10^(tone/6*(log10(110)-log10(55)));
x = x(round(fs*cut(1)):round(fs*cut(2)),:);
t = 0:1/fs:(size(x,1)-1)/fs;
p = audioplayer(x,fs);

%% Pseudo

xps = x(ceil(speed*(1:floor(size(x,1)/speed))),:);
tps = linspace(0,max(t)/speed,round(size(t,2)/speed));
xpt = x(ceil(tone*(1:floor(size(x,1)/tone))),:);
tpt = t;

%% Speed

ts = tps;
xs = zeros(size(xps,1),size(xps,2));
for ii = 1:ceil(size(x,1)/n)
    if ii < ceil(size(x,1)/n)
        kk = n;
    else
        kk = size(x,1)-(ii-1)*n;
    end
    if speed <= 1
        for jj = 1:floor(1/speed)
            xs((ii-1)*floor(n/speed)+(jj-1)*kk+1:(ii-1)*floor(n/speed)+jj*kk,:) = x((ii-1)*n+1:(ii-1)*n+kk,:);
        end
        xs((ii-1)*floor(n/speed)+jj*kk+1:(ii-1)*floor(n/speed)+jj*kk+floor((1/speed-jj)*kk),:) = ...
            x((ii-1)*n+1:(ii-1)*n+floor((1/speed-jj)*kk),:);
    else
        
        xs((ii-1)*floor(n/speed)+(1:floor(kk/speed)),:) = x((ii-1)*n+(1:floor(kk/speed)),:);
    end
end
xs(find(xs(:,1)~=0,1,'last')+1:end,:) = [];
ts(size(xs(:,1),1)+1:end) = [];
xs = filt2d(xs,16);
ps = audioplayer(xs,fs);

%% Tone

tt = t;
xt = zeros(round(size(xpt,1)*tone),size(xpt,2));
for ii = 1:ceil(size(xpt,1)/n)
    if ii < ceil(size(xpt,1)/n)
        kk = n;
    else
        kk = size(xpt,1)-(ii-1)*n;
    end
    if 1/tone <= 1
        for jj = 1:floor(tone)
            xt((ii-1)*floor(n*tone)+(jj-1)*kk+1:(ii-1)*floor(n*tone)+jj*kk,:) = xpt((ii-1)*n+1:(ii-1)*n+kk,:);
        end
        xt((ii-1)*floor(n*tone)+jj*kk+1:(ii-1)*floor(n*tone)+jj*kk+floor((tone-jj)*kk),:) = ...
            xpt((ii-1)*n+1:(ii-1)*n+floor((tone-jj)*kk),:);
    else
        
        xt((ii-1)*floor(n*tone)+(1:floor(kk*tone)),:) = xpt((ii-1)*n+(1:floor(kk*tone)),:);
    end
end
xt(find(xt(:,1)~=0,1,'last')+1:end,:) = [];
tt(size(xt(:,1),1)+1:end) = [];
xt = filt2d(xt,16);
pt = audioplayer(xt,fs);

%% Speed and Tone

tst = tps;
xst = zeros(size(xps,1),size(x,2));
for ii = 1:ceil(size(xpt,1)/n)
    if ii < ceil(size(xpt,1)/n)
        kk = n;
    else
        kk = size(xpt,1)-(ii-1)*n;
    end
    if speed/tone <= 1
        for jj = 1:floor(tone/speed)
            xst((ii-1)*floor(n*tone/speed)+(jj-1)*kk+1:(ii-1)*floor(n*tone/speed)+jj*kk,:) = ...
                xpt((ii-1)*n+1:(ii-1)*n+kk,:);
        end
        xst((ii-1)*floor(n*tone/speed)+jj*kk+1:(ii-1)*floor(n*tone/speed)+jj*kk+floor((tone/speed-jj)*kk),:) = ...
            xpt((ii-1)*n+1:(ii-1)*n+floor((tone/speed-jj)*kk),:);
    else
        
        xst((ii-1)*floor(n*tone/speed)+(1:floor(kk*tone/speed)),:) = xpt((ii-1)*n+(1:floor(kk*tone/speed)),:);
    end
end
xst(find(xst(:,1)~=0,1,'last')+1:end,:) = [];
tst(size(xst(:,1),1)+1:end) = [];
xst = filt2d(xst,16);
pst = audioplayer(xst,fs);

%% Output

% play(p)
% play(ps)
% play(pt)
% play(pst)

% figure, plot(t,x), axis tight
% figure, plot(ts,xs), axis tight
% figure, plot(tt,xt), axis tight
% figure, plot(tst,xst), axis tight