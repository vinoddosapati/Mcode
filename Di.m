function c=Di(matrix,n) 
c=zeros(1,n) ;
	for i=1:n
		sum=0;
		for j=1:n
			if(matrix(i,j) ~= 0)
				for k=1:n
					if(matrix(j,k) ~= 0)
						sum = sum+matrix(j,k);
					end
				end
			end
		end
		c(i) = sum;
	end
end  