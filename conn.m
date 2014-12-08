function sd = conn(matrix,n)
sd=zeros(n,n);
for i=1:n
    x1 = matrix(i,1);
    y1 = matrix(i,2);
    for j=i+1:n
        x2 = matrix(j,1);
        y2 = matrix(j,2);
        X=[x1,y1;x2,y2];
        d=pdist(X,'euclidean');
        if(d<=max(matrix)/10)
            sd(i,j)=1;
            sd(j,i)=1;
        end
    end
end
end