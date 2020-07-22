function [b,s] = onlydiag(a)

b = false(size(a));
c = -ones(size(a)) + double(a);

dn = [1 4 2 3; 4 1 3 2];
do = [0 90 180 270];
dp = [0 1; -1 0 ; 0 -1; 1 0];

p = [2 1];

s = 0;

while p(2)~=size(a,2)
    
    if p(2) == 1
        
        o = 0;
        b(p(1),p(2)) = true;
        c(p(1),p(2)) = 1;
        
    else
        
        n = 1 + double((p(2)/p(1))>(size(a,2)/size(a,1)));
        
        for k = dn(n,:)
            if c(p(1)+dp(k,1),p(2)+dp(k,2)) == 0
                d = true;
                break
            end
            d = false;
        end
        
        if d
            c(p(1),p(2)) = 1;
        else
            c(p(1),p(2)) = -1;
            for k = dn(n,:)
                if c(p(1)+dp(k,1),p(2)+dp(k,2)) == 1
                    break
                end
            end
        end
        
        o = do(k);
        
    end
    
    switch o
        case 0,  p = p + [0 1];
        case 90, p = p - [1 0];
        case 180, p = p - [0 1];
        case 270, p = p + [1 0];
    end
    
    b(p(1),p(2)) = true;
    
    s = s + 1;
    
end

end