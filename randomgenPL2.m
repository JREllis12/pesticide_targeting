function randomgenPL2
clear
N=1000000;
             a3=sqrt(2*pi);  sq2=sqrt(2);
             gamma=0.5; % the PL exponent
%             eps=1;   % parameter of the PL distribution
             eps=1;   % parameter of the PL distribution
                     cc=(gamma-1)*eps^(gamma-1);  gam2=1/(1-gamma);
amin=-5;  amax=5;
nan=101;    ha=(amax-amin)/(nan-1);

for j=1:nan
         agrid(j)=amin+ha*(j-1);  % testpdf(j)=erf(agrid(j));
                                  % cpdf(j)=N*(1-exp(-agrid(j)));
     pdfun(j)=N*ha*(1/a3)*exp(-0.5*agrid(j)^2);
     pdfun3(j)=0.5*N*ha*cc/(eps+abs(agrid(j)))^gamma;
end; 

for i=1:N
    a(i)=0;  anew(i)=0;  end;

for i=1:N
%    a(i)=random('exp',1);
    a(i)=randn;
end;

for i=1:N
%    anew(i)=a(i);
                    erfmod=erf(a(i)/sq2);
if a(i)>0
    anew(i)=eps*((1-erfmod)^gam2-1);  end;
if a(i)<0
    anew(i)=eps*(1-(1+erfmod)^gam2);  end;
end;

bb=anew;
%bb=abs(anew);

% calculating the hystogram:
                                 b=sort(anew);
for j=1:nan
           aj=agrid(j);  hist(j)=0;
for i=1:N-1
    if (b(i)<aj) & (b(i+1)>aj)
                            hist(j)=i;  end;
  end; end;

                histo(1)=0;
for j=2:nan
    histo(j)=hist(j)-hist(j-1);  
        if histo(j)<0
            histo(j)=0;  end;
end;

plot(agrid,histo,'x',agrid,pdfun3,'g-')
