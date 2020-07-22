function [b,s] = onlyright(a)

b = false(size(a));
b(2,1) = true;

m = [3 1 2 4; 1 2 4 3; 4 3 1 2; 2 4 3 1];
n = [-1 0; 0 -1; 0 1; 1 0];

p = [2 1];
o = 3;

s = 0;

while all(p~=size(a))
    
    for k = 1:4
        if a(p(1)+n(m(o,k),1),p(2)+n(m(o,k),2))
            b(p(1)+n(m(o,k),1),p(2)+n(m(o,k),2)) = true;
            p = p+n(m(o,k),:);
            o = m(o,k);
            break
        end
    end
    
    s = s + 1;
    
end

end