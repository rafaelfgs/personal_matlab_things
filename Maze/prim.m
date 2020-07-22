function a = prim(m,n,show)

a = false(2*m+1,2*n+1);
a(2,1:2) = true;
a(2*m,2*n+1) = true;

h = [2 2; zeros(m*n-1,2)];
k = 2;
c = 1;

if show
    im = imshow(a);
    drawnow
end

while sum(sum(a),2) < 2*m*n+1
    
    b = [~a(max([h(c,1)-2 2]),h(c,2)) ~a(h(c,1),max([h(c,2)-2 2])) ...
         ~a(h(c,1),min([h(c,2)+2 2*n])) ~a(min([h(c,1)+2 2*m]),h(c,2))];
     
    d = find(b);
    if ~isempty(d)
        switch d(randi(numel(d)))
            case 1
                a(h(c,1)-2:h(c,1),h(c,2)) = true;
                h(k,:) = h(c,:) + [-2 0];
            case 2
                a(h(c,1),h(c,2)-2:h(c,2)) = true;
                h(k,:) = h(c,:) + [0 -2];
            case 3
                a(h(c,1),h(c,2):h(c,2)+2) = true;
                h(k,:) = h(c,:) + [0 2];
            case 4
                a(h(c,1):h(c,1)+2,h(c,2)) = true;
                h(k,:) = h(c,:) + [2 0];
        end
    else
        h(c,:) = [0 0];
    end
    
    if numel(d) == 1
        h(c,:) = [0 0];
    end
    
    d = find(any(h~=0,2));
    c = d(randi(numel(d)));
    k = find(any(h==0,2),1);
    
    if show
        delete(im)
        im = imshow(a);
        drawnow
    end
    
end

end