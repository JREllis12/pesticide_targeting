% clear all
% Input variables
% Lx=10; %horizontal length of cell
% Ly=10; %vertical length of cell
% Nl=20; %bins in each dimension
% Nseg=6; %must be even
% 
% Np=1000; %no. of particles
% Nt=10000; %time steps
% 
% lt=3; ht=5;%1000/Nl^2;
% 
% sig=0.02; %standard dev. sigma
% P=0.05;
% R=1;
% 
% gamma=2;
% k1=(1.16*(2*sig^2)^0.5)/(10^(1/(gamma-1))-1); 
% 
% initial position
% Px(1:Np)=rand(1,Np)*Lx; 
% Py(1:Np)=rand(1,Np)*Ly; 


%% Random Walk
tic
Nt=10000;
for j=1000:Nt-1
     j
    [Px(j+1,:),Py(j+1,:)]=nextstepnormal(Px(j,:),Py(j,:),sig,P,R,Np,Nseg,Lx,Ly);
end
rwtoc=toc

