function [ SEV ] = PlotPlume_ref()
%Exposure risk decay as a function of release location, concenntration,
%and duration as plume travels downstream.
%Considers CCME (2002) Guidelines of 25mg/L over 24 hour duration
%Figure 1 in Paper 1
%Calculates plume Sev Scores and then pulls out the side and centerline SEV
%profiles
%Doubles concentration for fixed sediment flux to account for reflection
%Outputs SEV decay profiles for fixed reference concentration and fixed
%sediment flux

Cr=25;
t=24;

i=1;
j=1;
xr=0.0001;

S_Side1=SevPlume_ref( 0,Cr,xr,0,t )

S_Center1=SevPlume_ref( 0.5,Cr,xr,0.5,t );

S_Side2=SevPlume_ref( 0,Cr*2,xr,0,t );  %Constant sediment flux, concentration is doubled due to reflection


[k,m] = size(S_Side1);

for p=1:k
    

        Plot_Side1(p,1)=S_Side1(p,1);
        Plot_Center1(p,1)=S_Center1(p,6);
 
        
        X(p,1)=p*0.001;
       
end

[k,m] = size(S_Side2);

for p=1:k
    

        Plot_Side2(p,1)=S_Side2(p,1);
        Plot_Center1(p,1)=S_Center1(p,6);
 
        
        X2(p,1)=p*0.001;
       
end

f = figure;
p = uipanel('Parent',f,'BorderType','none'); 
p.Title = 'Exposure Risk Decay'; 
p.TitlePosition = 'centertop'; 
p.FontSize = 24;
p.FontWeight = 'bold';

ax1 = subplot(1,2,1,'Parent',p);
plot(ax1,X,Plot_Side1,'k')
title('Fixed Reference Concentration','fontsize', 18)
ylabel('SEV','fontsize', 18)
xlabel('x''','fontsize', 18)
xlim([0 0.4])
ylim([0 10])
set(gca,'fontsize',18)  %change axis font size
text(0.02,6.75,{'Average SEV Score Over Total Habitat Area:','Side Release=2.22','Centerline Release=2.84'},'fontsize', 14)
text(0.02,8,{'Reference Concentration:','Side Release=25mg/L','Centerline Release=25mg/L'},'fontsize', 14)
hold on

plot(ax1,X,Plot_Center1,'--k')
refline(0,5.37)

lgd1 = legend('Side Release','Center Release','CCME (2002) Guidelines');
lgd1.FontSize = 14;

hold off




t=[1:24];

ax2 = subplot(1,2,2,'Parent',p);
plot(ax2,X2,Plot_Side2,'k')
title('Fixed Sediment Flux','fontsize', 18)
ylabel('SEV','fontsize', 18)
xlabel('x''','fontsize', 18)
xlim([0 0.4])
ylim([0 10])
set(gca,'fontsize',18)  %change axis font size
text(0.02,6.75,{'Average SEV Score Over Total Habitat Area:','Side Release=2.71','Centerline Release=2.84'},'fontsize', 14)
text(0.02,8,{'Reference Concentration:','Side Release=50mg/L','Centerline Release=25mg/L'},'fontsize', 14)
hold on

plot(X2,Plot_Center1,'--k')

refline(0,5.37)

lgd2 = legend('Side Release','Center Release','CCME (2002) Guidelines');
lgd2.FontSize = 14;
hold off






end
