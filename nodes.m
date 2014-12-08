clear;
figure(1);
hold on;
%plot(0,0,'o');
CHarr=zeros(1,5);
IccArr = zeros(1,5);
OccArr = zeros(1,5);
NSizeArr = zeros(1,5);
NoArr = zeros(1,5);
for f=1:5

n = f*100; %No of nodes
for no=1:5

cordn = Fun(n);
%cm = randi([0,1],n,n); %connection matrix
cm = conn(cordn,n);
chm = randi([7,10],n,n);  %channel matrix

for i = 1:n
    for j = 1:n
        if(i == j) %Not self connected in cm
            cm(i,j)=0;
        end
        if(cm(i,j) == 0)
              chm(i,j)=0;
        end
    end
end

for i = 1:n
  for j = i:n
      cm(j,i) = cm(i,j);
      chm(j,i) = chm(i,j);
  end
end

cm;
chm;

di=Di(chm,n);
ch=Ch(chm,di,n);
nC=Cluster(ch,n);
CHarr(f) = CHarr(f)+nC;


%plot(n,nC,'-*')   %graph for node vs no cluster heads
%plot(n,n/nC,'*');   %graph for cluster size

NoArr(f) = NoArr(f) + nC;
NSizeArr(f) = NSizeArr(f) + n/nC;

icc = Icc(chm,ch,n);
avgicc = icc/nC;
IccArr(f) = IccArr(f) + avgicc;
%plot(n,avgicc,'-x');    %graph for icc
occ=Occ(ch,chm,n);
avgocc = occ/nC;
OccArr(f) = OccArr(f) + avgocc;
%plot(n,avgocc,'-o');   %graph for occ
end
end

for am=1:5
    l=(am)*100;
    k=NoArr(am)/5;     %1.No of Cluster heads
    %k=NSizeArr(am)/5; %2.Avg Cluster Size
    %k=IccArr(am)/5;   %3.ICC-No Channels
    %k=OccArr(am)/5;   %4.OCC-No Channels
    plot(l,k,'*');
end