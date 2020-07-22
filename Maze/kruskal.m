function a = kruskal(m,n,show)

a = false(2*m+1,2*n+1);
a(2,1) = true;
a(2*m,2*n+1) = true;

b = zeros(m,n);
c = true(m,n);

if show
    im = imshow(a);
    drawnow
end

while sum(sum(a),2) < 2*m*n+1
    
    x = find(c);
    x = x(randi(numel(x)));
    x = [mod(x-1,m)+1 ceil(x/m)];
    
    if b(x(1),x(2)) == 0
        b(x(1),x(2)) = find(~ismember(1:m*n,b),1);
    end
    
    d = [b(max([x(1)-1 1]),x(2)) b(x(1),max([x(2)-1 1])) ...
         b(x(1),min([x(2)+1 n])) b(min([x(1)+1 m]),x(2))] == 0 | ...
        [b(max([x(1)-1 1]),x(2)) b(x(1),max([x(2)-1 1])) ...
         b(x(1),min([x(2)+1 n])) b(min([x(1)+1 m]),x(2))] ~= b(x(1),x(2));
     
    y = find(d);
    if ~isempty(y)
        switch y(randi(numel(y)))
            case 1
                a(2*x(1)-2:2*x(1),2*x(2)) = true;
                if b(x(1)-1,x(2)) > 0
                    b(b==b(x(1)-1,x(2))) = b(x(1),x(2));
                else
                    b(x(1)-1,x(2)) = b(x(1),x(2));
                end
            case 2
                a(2*x(1),2*x(2)-2:2*x(2)) = true;
                if b(x(1),x(2)-1) > 0
                    b(b==b(x(1),x(2)-1)) = b(x(1),x(2));
                else
                    b(x(1),x(2)-1) = b(x(1),x(2));
                end
            case 3
                a(2*x(1),2*x(2):2*x(2)+2) = true;
                if b(x(1),x(2)+1) > 0
                    b(b==b(x(1),x(2)+1)) = b(x(1),x(2));
                else
                    b(x(1),x(2)+1) = b(x(1),x(2));
                end
            case 4
                a(2*x(1):2*x(1)+2,2*x(2)) = true;
                if b(x(1)+1,x(2)) > 0
                    b(b==b(x(1)+1,x(2))) = b(x(1),x(2));
                else
                    b(x(1)+1,x(2)) = b(x(1),x(2));
                end
        end
    else
        c(x(1),x(2)) = false;
    end
    
    if show
        delete(im)
        im = imshow(a);
        drawnow
    end
    
end

end