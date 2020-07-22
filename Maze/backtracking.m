function a = backtracking(m,n,show)

a = false(2*m+1,2*n+1);
a(2,1:2) = true;
a(2*m,2*n+1) = true;

h = [2 2; zeros(m*n-1,2)];
k = 1;

if show
    im = imshow(a);
    drawnow
end

while sum(sum(a),2) < 2*m*n+1
    
    b = [~a(max([h(k,1)-2 2]),h(k,2)) ~a(h(k,1),max([h(k,2)-2 2])) ...
         ~a(h(k,1),min([h(k,2)+2 2*n])) ~a(min([h(k,1)+2 2*m]),h(k,2))];
    
    d = find(b);
    if ~isempty(d)
        switch d(randi(numel(d)))
            case 1
                a(h(k,1)-2:h(k,1),h(k,2)) = true;
                h(k+1,:) = h(k,:) + [-2 0];
            case 2
                a(h(k,1),h(k,2)-2:h(k,2)) = true;
                h(k+1,:) = h(k,:) + [0 -2];
            case 3
                a(h(k,1),h(k,2):h(k,2)+2) = true;
                h(k+1,:) = h(k,:) + [0 2];
            case 4
                a(h(k,1):h(k,1)+2,h(k,2)) = true;
                h(k+1,:) = h(k,:) + [2 0];
        end
        k = k + 1;
    else
        h(k,:) = [0 0];
        k = k - 1;
    end
    
    if show
        delete(im)
        im = imshow(a);
        drawnow
    end
    
end

end