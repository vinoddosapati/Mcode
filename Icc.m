function sum = Icc(conn,cluster,n)
c=zeros(1,n);
for i=1:n
    if(cluster(i,i) == i)
        min = 11;
       for j=1:n
           if(i~=j)
               if(cluster(i,j) ~= 0)
                   if(min > conn(i,j))
                      min = conn(i,j);
                   end
               end
           end
       end
       if(min == 11)
           c(i)=0;
       elseif(min ~= 11)
           c(i) = min;
       end
    end
end
sum = 0;
for k=1:n
    sum = sum+c(k);
end
end