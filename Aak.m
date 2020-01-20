%calculation of control effect
n_test=1e4;
n_atk=100;
shift=0;swi=0;
for k=1:n_test
    for i=1:n_atk;
        switch unidrnd(4)
        case {1,2}
            if swi==1
                shift=shift+1.22;
            else 
                shift=shift+1.3;
            end
            swi=0;
        case 3
            shift=shift+0.26;
            swi=1;
        case 4
            shift=shift+0.3;
            swi=0;
        end    
    end
    deceleration(k)=1-shift/(1.3*n_atk);
    shift=0;
end
[mu,sigma]=normfit(deceleration)
%bar(deceleration)
[counts,centers]=hist(deceleration,20);
bar(centers,counts/sum(counts))
