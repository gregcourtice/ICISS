function [ Cr1,Cr2 ] = vary_C_ref( t )
%Average normalized exposure risk per unit area of river as a function of
%release point
i=1;
j=1;
xr=0.0001;



for Cr=1:500

S1=SevPlume_ref( 0,Cr,xr,0,t );
[k,m]=size(S1);
Cr1(i,j)=sum(sum(S1))/k/m;

S2=SevPlume_ref( 0.5,Cr,xr,0.5,t);
Cr2(i,j)=sum(sum(S2))/k/m;


j=j+1;

end


c=[1:500];

plot(c,Cr1,'k')
title('Average Exposure Risk x''<0.4 - Varying Concentration, t=24h','fontsize', 24)
ylabel('SEV','fontsize', 24)
xlabel('Reference Concentration at x''=0.0001, mg/L','fontsize', 24)
xlim([0 500])
ylim([0 10])
hold on

plot(c,Cr2,'--k')
refline(0,5.37)

lgd=legend('Side Release','Center Release','CCME (2002) Guidelines');
set(lgd,'fontsize', 16);

hold off

end

