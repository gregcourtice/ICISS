function [ n1,n2,n3,n4,n5 ] = fraction_ref( )
%Fraction of total area exceeding CCME (2002) Guidelines
%Tells DetailPlume a range for concentrations to consider
%Takes SEV scores calculated in DetailPlume
%Determines how much area of the plume exceeds CCME Guidelines
%Divide this area by total area
%Plot area as a function of concentration for several durations
i=1;
j=1;


t1=5;
for C=1:500

    
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
n1(i,j)=nnz(s1)/numel(s1)*100

j=j+1;

end
j=1;
t2=10;
for C2=1:500

    
S2=DetailPlume( 0.5,C2,t2 );
[k,m]=size(S2);               %Determining how much of the plume area has exposure risk, 
                               %assuming important for SEV>5% of SEV0
s2=S2;
for p=1:1:k
    for q=1:1:m
        if S2(p,q)>5.37
            s2(p,q)=S2(p,q);
        else
            s2(p,q)=0;
        end
    end
end
n2(i,j)=nnz(s2)/numel(s2)*100

j=j+1;

end
j=1;
t3=15;
for C3=1:500

    
S3=DetailPlume( 0.5,C3,t3 );
[k,m]=size(S3);               %Determining how much of the plume area has exposure risk, 
                               %assuming important for SEV>5% of SEV0
s3=S3;
for p=1:1:k
    for q=1:1:m
        if S3(p,q)>5.37
            s3(p,q)=S3(p,q);
        else
            s3(p,q)=0;
        end
    end
end
n3(i,j)=nnz(s3)/numel(s3)*100

j=j+1;

end
j=1;
t4=20;
for C4=1:500

    
S4=DetailPlume( 0.5,C4,t4 );
[k,m]=size(S4);               %Determining how much of the plume area has exposure risk, 
                               %assuming important for SEV>5% of SEV0
s4=S4;
for p=1:1:k
    for q=1:1:m
        if S4(p,q)>5.37
            s4(p,q)=S4(p,q);
        else
            s4(p,q)=0;
        end
    end
end
n4(i,j)=nnz(s4)/numel(s4)*100

j=j+1;

end
j=1;
t5=24;
for C5=1:500

    
S5=DetailPlume( 0.5,C5,t5 );
[k,m]=size(S5);               %Determining how much of the plume area has exposure risk, 
                               %assuming important for SEV>5% of SEV0
s5=S5;
for p=1:1:k
    for q=1:1:m
        if S5(p,q)>5.37
            s5(p,q)=S5(p,q);
        else
            s5(p,q)=0;
        end
    end
end
n5(i,j)=nnz(s5)/numel(s5)*100

j=j+1;

end


plot(n1,'b','linewidth',2)
title('Habitat Area Exceeding CCME (2002) Guidelines','fontsize', 24)
ylabel('Habitat Area where SEV>5.37 (%)','fontsize', 18)
xlabel('Reference Concentration at x''=0.0001, mg/L','fontsize', 18)
ylim([0 0.5])
set(gca,'fontsize',18)  %change axis font size

hold on

plot(n2,'--k','linewidth',2)
plot(n3,':k','linewidth',2)
plot(n4,'-.k','linewidth',2)
plot(n5,'k','linewidth',2)
lgd=legend('t=5','t=10','t=15','t=20','t=24');
lgd.Location = 'northwest';
set(lgd,'fontsize',14)
hold off
end

