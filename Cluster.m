function nC=Cluster(matrix,n)
nC = 0;
    for i=1:n
        p=0;
        for j=1:n
            if(matrix(i,j) ~= 0)
                p=p+3;
            end
        end
        if(p~=0)
            nC=nC+1;
        end
    end
end