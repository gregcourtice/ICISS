function [ n ] = fraction_ccme( )
%Fraction of total area exceeding CCME (2002) Guidelines
%Tells DetailPlume a range for concentrations to consider
%Takes SEV scores calculated in DetailPlume
%Determines how much area of the plume exceeds CCME Guidelines
%Divide this area by total area
%Plot area as a function of concentration for several durations
i=1;
j=1;


t1=24;
for C=1:25

    
S1=DetailPlume( 0.5,C,t1 );
[k,m]=size(S1);               %Determining how much of the plume area has exposure risk, 
                               %assuming important for SEV>5% of SEV0
s1=S1;
for p=1:1:k
    for q=1:1:m
        if S1(p,q)>5.37
            s1(p,q)=S1(p,q);
        else
            s1(p,q)=0;
        end
    end
end
n(i,j)=nnz(s1)/numel(s1)*100;

j=j+1;

end
plot(n,'b')
title('Habitat Area Exceeding CCME (2002) Guidelines','fontsize', 24)
ylabel('Habitat Area where SEV>5.37 (%)','fontsize', 18)
xlabel('Reference Concentration at x''=0.0001, mg/L','fontsize', 18)
ylim([0 0.5])
set(gca,'fontsize',18)  %change axis font size


end

