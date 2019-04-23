% clear all
% load('Normal_100kt','Px','Py','Np','Nt')

Lx=10; Ly=10;
lt=3; ht=5;

Nl=20;

 for j=1:Nt
     j
 Pc=[Px(j,:) ;Py(j,:)]';
 
 
Bx=Lx/Nl:Lx/Nl:Lx; By=Ly/Nl:Ly/Nl:Ly;

 clear Pt
 Pt(:,:)=histcounts2(Pc(:,1), Pc(:,2),0:Lx/Nl:Lx,0:Ly/Nl:Ly);

 
for i=1:1000
    for Bi=1:Nl
        for Bj=1:Nl
            if Px(end,i)>=Bx(Bi)-Lx/Nl & Px(end,i)<=Bx(Bi) &&...
                    Py(end,i)>=By(Bj)-Ly/Nl & Py(end,i)<=By(Bj)
                Pb(i,:)=[Bi Bj];
            end
        end
    end
end


[C,Fb,Rt]=patchdefIBM(lt,ht,Pt);

[Bl,L,No]=bwboundaries(C,4,'noholes');
%     Bo{:, j}=Bl;
Pcl=diag(L(Pb(:,1),Pb(:,2)));  
for c=1:No
    Clp{c}=find(Pcl==c);
    [Corn{c},area(c)]=boundary(Pc(Clp{c},:),0.2);
end
    Area{j}=area;
    [cltotal, clnumber, claverage, clarea, cldensity, Cdensity]=clusterprocessingIBM(L, C, Bl,Nl);
    pop{j}=cltotal;
    free=Np-sum(cltotal);
    clpopmean=mean(cltotal);
Nc(j)=No;
popm(j)=clpopmean;
Am(j)=mean(area);
 end
 
for j=1:Nt
   for c=1:max(No)
       if length(Area{j})>=c
       A(j,c)=Area{j}(c);
       else A(j,c)=nan;
       end
       if length(pop{j})>=c
       Pop(j,c)=pop{j}(c);
       else Pop(j,c)=nan;
       end
   end
end
 
figure
plot(Px(j,:),Py(j,:),'.')
for i=1:No
hold on
plot(Px(end,Clp{i}(Corn{i})),Py(end,Clp{i}(Corn{i})))
end