function out = filt2d(in,m)

d = size(in);

p = 0.5;
n = 2*m;
x = (0:n);

b = (factorial(n)./(factorial(x).*factorial(n-x))) .* p.^x .* (1-p).^(n-x);

in_layers = zeros(d(1),d(2),n+1);

for k = 1:n+1
    in_layers(:,:,k) = [repmat(in(1,:),max([0 m-k+1]),1); ...
                        in(max([1 k-m]):min([d(1) d(1)+k-m-1]),:); ...
                        repmat(in(d(1),:),max([0 k-m-1]),1)];
end

out = sum(permute(repmat(b,d(1),1,d(2)),[1 3 2]) .* in_layers,3);

end