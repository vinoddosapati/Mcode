function ch = Ch(matrix,array,n)
ch = zeros(n,n);
    for i = 1:n
        p=0;
        p2=0;
        min = array(i);
        for j=1:n
            if(matrix(i,j) ~= 0)
                if(min > array(j))
                    min = array(j);
                    p=j;
                end
            end
        end
        if(min == array(i))
            ch(i,i) = i;
        elseif(min ~= array(i))
            for k=1:n
                if(matrix(p,k) ~= 0 )
                    if(min > array(k))
                        min = array(k);
                        p = k;
                        p2=k;
                    end
                end
            end
            if(min == array(p))
                ch(p,p) = p;
                ch(p,i) = i;
            elseif(min ~= array(p))
                for l=1:n
                    if(matrix(p,l) ~= 0)
                        if(min > array(l))
                            min = array(l);
                            p=l;
                        end
                    end
                end
                if(min == array(p))
                    ch(p,p) = p;
                    ch(p,i) = i;
                    ch(p,p2) = p2;
                else
                    ch(i,i)=i;
                end
            end
        end
    end
end
                
