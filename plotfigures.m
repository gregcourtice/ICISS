function [] = plotfigures()
%Average exposure risk as a function concenntration,
%and duration
%Figure 2 in Paper 1
%Calculates plume Sev Scores with varying concentration and duration 
%Calculates average SEV score by dividing the sum of all SEV scores by the
%area
%Outputs average SEV score as a function of concentration and duration

[Cr1,Cr2]=vary_C_ref(5);
[Cr3,Cr4]=vary_C_ref(24);
[T1,T2]=vary_t_ref(25);
[T3,T4]=vary_t_ref(250);

c=1:500;

f = figure;
p = uipanel('Parent',f,'BorderType','none'); 
p.Title = 'Average Exposure Risk'; 
p.TitlePosition = 'centertop'; 
p.FontSize = 24;
p.FontWeight = 'bold';

ax1 = subplot(1,2,1,'Parent',p);
plot(ax1,c,Cr1,'k')
title('Concentration-Varied Exposure Risk','fontsize', 18)
ylabel('SEV','fontsize', 18)
xlabel('Reference Concentration, mg/L','fontsize', 18)
xlim([0 500])
ylim([0 10])
set(gca,'fontsize',18)  %change axis font size
hold on

plot(ax1,c,Cr2,'--k')
plot(ax1,c,Cr3,'g')
plot(ax1,c,Cr4,'--g')
refline(0,5.37)

lgd1 = legend('Side Release, t=5h','Center Release, t=5h','Side Release, t=24h','Center Release, t=24h','CCME (2002) Guidelines');
lgd1.FontSize = 14;

hold off




t=[1:24];

ax2 = subplot(1,2,2,'Parent',p);
plot(ax2,t,T1,'k')
title('Duration-Varied Exposure Risk','fontsize', 18)
ylabel('SEV','fontsize', 18)
xlabel('Exposure Duration, hours','fontsize', 18)
xlim([0 24])
ylim([0 10])
set(gca,'fontsize',18)  %change axis font size
hold on

plot(ax2,t,T2,'--k')
plot(ax2,t,T3,'g')
plot(ax2,t,T4,'--g')
refline(0,5.37)

lgd2 = legend('Side Release, C=25mg/L','Center Release, C=25mg/L','Side Release, C=250mg/L','Center Release, C=250mg/L','CCME (2002) Guidelines');
lgd2.FontSize = 14;
hold off

end
