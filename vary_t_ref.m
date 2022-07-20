function [ T1,T2 ] = vary_t_ref( Cr)
%Average normalized exposure risk per unit area of river as a function of
%release point
i=1;
j=1;
xr=0.0001;

R=zeros(1,1000);

for t=1:24

S1=SevPlume_ref( 0,Cr,xr,0,t );
[k,m]=size(S1);
T1(i,j)=sum(sum(S1))/k/m;

S2=SevPlume_ref( 0.5,Cr,xr,0.5,t);
T2(i,j)=sum(sum(S2))/k/m;


j=j+1;

end


t=[1:24];

plot(t,T1,'k')
title('Average Exposure Risk x''<0.4 - Varying Duration')
ylabel('SEV')
xlabel('Duration, hours')
xlim([0 24])
ylim([0 10])
hold on

plot(t,T2,'--k')

refline(0,5.37)

legend('Side Release','Center Release','CCME (2002) Guidelines')

hold off

end

