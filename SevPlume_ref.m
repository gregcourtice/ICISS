function [ S ] = SevPlume_ref( y0,Cr,xr,yr,t )
%Average exposure risk per unit area of river.
%Normalized with reference concentration.

%W=channel width (m), d=depth (m), S=slope, 
%y0=normalized release location
%Cr=reference concentration (mg/L), xr,yr=normalized reference point location
%b=plume release width, t=duration of release



i=400;
j=10;

C=zeros(i,j);
SEV=zeros(i,j);

R_ref=exp(-(yr+2-y0)^2/(4*xr))+exp(-(yr+2+y0)^2/(4*xr))+exp(-(yr-y0)^2/(4*xr))+exp(-(yr+y0)^2/(4*xr))+exp(-(yr-2-y0)^2/(4*xr))+exp(-(yr-2+y0)^2/(4*xr));


SEVR=1.0642+0.6068*log(t)+0.7384*log(Cr);
j=1;
for y=0:0.1:1

    i=1;
	for x=0.00001:0.001:0.4


R=exp(-(y+2-y0)^2/(4*x))+exp(-(y+2+y0)^2/(4*x))+exp(-(y-y0)^2/(4*x))+exp(-(y+y0)^2/(4*x))+exp(-(y-2-y0)^2/(4*x))+exp(-(y-2+y0)^2/(4*x));	%reflection term
R_ref=exp(-(yr+2-y0)^2/(4*xr))+exp(-(yr+2+y0)^2/(4*xr))+exp(-(yr-y0)^2/(4*xr))+exp(-(yr+y0)^2/(4*xr))+exp(-(yr-2-y0)^2/(4*xr))+exp(-(yr-2+y0)^2/(4*xr));	%reference reflection term
C(i,j)=Cr*sqrt(xr/x)*R/R_ref;
SEV(i,j)=1.0642+0.6068*log(t)+0.7384*log(C(i,j));
if SEV(i,j)<0
   SEV(i,j)= 0;
end

N(i,j)=SEV(i,j);


i=i+1;

    end
j=j+1;
end
S = N;





end

