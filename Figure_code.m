for i=1%:4
% im=[1,200,500,1000];
% ii=im(i);
% for i=1;
% figure(i)
set(i,'paperunits','centimeters');
set(i,'papersize',[16 14]);
set(i,'paperposition',[0 0 16 14]);
% set(i,'papersize',[20 14]);
% set(i,'paperposition',[0 0 20 14]);


% plot(Px(1:100,:),Py(1:100,:))
% contourf(Pt(:,:,ii))
% colorbar
% histogram(delx(2,:),20,'Normalization','probability')
% plot(Nc(:,1))
% bar(D(50000,:))

% contourf(0:1/(length(F)-1):1,0:1/(length(F)-1):1,C1(12:-1:1,:),[0,1,Cm/9,2*Cm/9,3*Cm/9,4*Cm/9,5*Cm/9,6*Cm/9,7*Cm/9,8*Cm/9,Cm-1])
% colorbar 
% set(gca,'yScale','log')
ylim([0 10])
xlim([0 10])

yticklabels(1:1:10)

ylabel('$N_c$','interpreter','latex','FontSize',16);
xlabel('$t$','interpreter','latex','FontSize',16);

ylabel('$y$','interpreter','latex','FontSize',16)
xlabel('$x$','interpreter','latex','FontSize',16);

hl=legend('Orignal plot', 'Smoothed plot');
set(hl,'interpreter','latex','FontSize',16);


print(i,'-dpdf',['PowerLaw_1_Ncvt.pdf']);
savefig('PowerLaw_1_Ncvt.fig');
% A=[13,14,17,19];
% j=A(i);
% j=i;

% print(i,'-dpdf',['Disc_dist_',num2str(ii),'.pdf']);
% savefig(['Disc_dist_',num2str(ii),'.fig']);

end