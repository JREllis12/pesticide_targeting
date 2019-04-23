clear all
%Input variables
Lx=10; %horizontal length of cell
Ly=10; %vertical length of cell
Nseg=6; %must be even

Np=1000; %no. of particles
Nt=100; %time steps
Nk=10; %Number of simulations

sig=0.02; %standard dev. sigma
P=0.6;
R=1;

gamma=2;
k1=(1.16*(2*sig^2)^0.5)/(10^(1/(gamma-1))-1); 

parfor k=1:Nk
    %initial position
    Px(1:Np)=rand(1,Np)*Lx; 
    Py(1:Np)=rand(1,Np)*Ly; 


    %% Random Walk
    for j=1:Nt-1
         j
        [Px,Py]=nextstepnormal(Px(j,:),Py(j,:),sig,P,R,Np,Nseg,Lx,Ly);
    end
        
    X(:,k)=Px;
    Y(:,k)=Py;
end