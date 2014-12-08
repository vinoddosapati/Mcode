function d=Occ(chmat,connmat,n)
d=0;
for i=1:n
    if(chmat(i,i) == i)
        min = 11;
        p=0;
        q=0;
        for l=1:n
            if(chmat(i,l) ~= 0)
                for j=i+1:n
                    if(chmat(j,j) == j)
                        for k=1:n
                            if(chmat(i,k) == 0)
                                if(chmat(j,k) ~= 0)
                                    if(connmat(l,k) ~= 0)
                                        if(min > connmat(l,k))
                                            min = connmat(l,k);
                                            p=l;
                                            q=k;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if(min ~= 11)
        d = d+connmat(p,q);
        end
    end
end
end