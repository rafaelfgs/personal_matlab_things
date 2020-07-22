clc
clear

k = 1;
m = 6;
n = 8;

a = false(4,3,k,2*m+1,2*n+1);
t = zeros(4,3,k);
s = zeros(4,3,k);

for ii = 1:k
    
    fprintf('iteration = %d',ii)
    
    fprintf(' | backtracking: ')
    tic
    a(1,1,ii,:,:) = backtracking(m,n,false);
    t(1,1,ii) = toc;
    s(1,1,ii) = sum(sum(a(1,1,ii,:,:)));
    fprintf('ok')
    
    fprintf(' | prim: ')
    tic
    a(1,2,ii,:,:) = prim(m,n,false);
    t(1,2,ii) = toc;
    s(1,2,ii) = sum(sum(a(1,2,ii,:,:)));
    fprintf('ok')
    
    fprintf(' | kruskal: ')
    tic
    a(1,3,ii,:,:) = kruskal(m,n,false);
    t(1,3,ii) = toc;
    s(1,3,ii) = sum(sum(a(1,3,ii,:,:)));
    fprintf('ok')
    
    fprintf(' | onlyright: ')
    for jj = 1:3
        tic
        [a(2,jj,ii,:,:),s(2,jj,ii)] = onlyright(squeeze(a(1,jj,ii,:,:)));
        t(2,jj,ii) = toc;
        %s(2,jj,ii) = sum(sum(a(2,jj,ii,:,:)));
    end
    fprintf('ok')
    
    fprintf(' | onlyleft: ')
    for jj = 1:3
        tic
        [a(3,jj,ii,:,:),s(3,jj,ii)] = onlyleft(squeeze(a(1,jj,ii,:,:)));
        t(3,jj,ii) = toc;
        %s(3,jj,ii) = sum(sum(a(3,jj,ii,:,:)));
    end
    fprintf('ok')
    
    fprintf(' | onlydiag: ')
    for jj = 1:3
        tic
        [a(4,jj,ii,:,:),s(4,jj,ii)] = onlydiag(squeeze(a(1,jj,ii,:,:)));
        t(4,jj,ii) = toc;
        %s(4,jj,ii) = sum(sum(a(4,jj,ii,:,:)));
    end
    fprintf('ok')
    
    fprintf('\n')
    
end

figure
subplot(3,4,1), imshow(squeeze(a(1,1,k,:,:))), title('backtracking')
subplot(3,4,2), imshow(squeeze(a(2,1,k,:,:))), title('right')
subplot(3,4,3), imshow(squeeze(a(3,1,k,:,:))), title('left')
subplot(3,4,4), imshow(squeeze(a(4,1,k,:,:))), title('diag')
subplot(3,4,5), imshow(squeeze(a(1,2,k,:,:))), title('prim')
subplot(3,4,6), imshow(squeeze(a(2,2,k,:,:))), title('right')
subplot(3,4,7), imshow(squeeze(a(3,2,k,:,:))), title('left')
subplot(3,4,8), imshow(squeeze(a(4,2,k,:,:))), title('diag')
subplot(3,4,9), imshow(squeeze(a(1,3,k,:,:))), title('kruskal')
subplot(3,4,10),imshow(squeeze(a(2,3,k,:,:))), title('right')
subplot(3,4,11),imshow(squeeze(a(3,3,k,:,:))), title('left')
subplot(3,4,12),imshow(squeeze(a(4,3,k,:,:))), title('diag')