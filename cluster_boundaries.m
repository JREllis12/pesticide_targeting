clear all
load('Normal_005P','Px','Py','Np');
% load('Normal_sqrt2R_10k','X','Y','Np');
Lx=10; Ly=10;
lt=3; ht=5;

Nl=20;

% Px=X{7}; Py=Y{7};
 Pc=[Px(5000,:) ;Py(5000,:)]';
 

Bx=Lx/Nl:Lx/Nl:Lx; By=Ly/Nl:Ly/Nl:Ly;


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

    [cltotal, clnumber, claverage, clarea, cldensity, Cdensity]=clusterprocessingIBM(L, C, Bl,Nl);
    free=Np-sum(cltotal);
    clpopmean=mean(cltotal);
    

n=reshape(Pt,Nl^2,1);

MI=Nl*(sum(n.*(n-1)))/(Np*(Np-1))    
    
No
free
clpopmean
mean(area)
figure
plot(Px(end,:),Py(end,:),'.')
for i=1:No
hold on
plot(Px(end,Clp{i}(Corn{i})),Py(end,Clp{i}(Corn{i})))
end