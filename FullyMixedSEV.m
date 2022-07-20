function [ SEV ] = FullyMixedSEV( t )
%Plots SEV at fully mixed distance as a function of reference location SEV
%First calculates concentrations of plume based on reference concentration
%Then determines SEV of reference location and x'=0.4

y=0.5;
y0=0.5;
yr=0.5;

xr=0.0001;
x1=0.1;
x2=0.4;
x3=1;

R1=exp(-(y+2-y0)^2/(4*x1))+exp(-(y+2+y0)^2/(4*x1))+exp(-(y-y0)^2/(4*x1))+exp(-(y+y0)^2/(4*x1))+exp(-(y-2-y0)^2/(4*x1))+exp(-(y-2+y0)^2/(4*x1));	%reflection term
R2=exp(-(y+2-y0)^2/(4*x2))+exp(-(y+2+y0)^2/(4*x2))+exp(-(y-y0)^2/(4*x2))+exp(-(y+y0)^2/(4*x2))+exp(-(y-2-y0)^2/(4*x2))+exp(-(y-2+y0)^2/(4*x2));
R3=exp(-(y+2-y0)^2/(4*x3))+exp(-(y+2+y0)^2/(4*x3))+exp(-(y-y0)^2/(4*x3))+exp(-(y+y0)^2/(4*x3))+exp(-(y-2-y0)^2/(4*x3))+exp(-(y-2+y0)^2/(4*x3));

R_ref=exp(-(yr+2-y0)^2/(4*xr))+exp(-(yr+2+y0)^2/(4*xr))+exp(-(yr-y0)^2/(4*xr))+exp(-(yr+y0)^2/(4*xr))+exp(-(yr-2-y0)^2/(4*xr))+exp(-(yr-2+y0)^2/(4*xr));	%reference reflection term

i=1;
for j=1:250
Cr=j;

SEVR(i,j)=1.0642+0.6068*log(t)+0.7384*log(Cr);

C1(i,j)=Cr*sqrt(xr/x1)*R1/R_ref;
SEV1(i,j)=1.0642+0.6068*log(t)+0.7384*log(C1(i,j));
if SEV1(i,j)<0
   SEV1(i,j)= 0;
end
C2(i,j)=Cr*sqrt(xr/x2)*R2/R_ref;
SEV2(i,j)=1.0642+0.6068*log(t)+0.7384*log(C2(i,j));
if SEV2(i,j)<0
   SEV2(i,j)= 0;
end
C3(i,j)=Cr*sqrt(xr/x3)*R3/R_ref;
SEV3(i,j)=1.0642+0.6068*log(t)+0.7384*log(C3(i,j));
if SEV3(i,j)<0
   SEV3(i,j)= 0;
end

Fit=polyfit(SEVR,SEV1,1);

plot(SEVR,SEV1,'k')
hold on
xlabel('SEV, x''=0.0001','FontSize', 18)
ylabel('SEV, x''>0.4','FontSize', 18)
set(gca,'fontsize',18)  %change axis font size
title('Fully Mixed Exposure Risk VS Reference Location Exposure Risk','FontSize', 24)
text(3,4.5,'SEV(x''>0.4) = SEV(x''=0.0001) - 2.438','FontSize', 14)

hold off
end


end
