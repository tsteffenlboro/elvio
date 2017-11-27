function []=elvio_plot_waterfall(l)
    res = [];
    leg = {};
    for i=1:l.numElements
        if isempty(regexp(l{i}.Name,'^E_')), continue, end
        E = l{i}.Values.Data;
        if length(size(E))==3
            E = E(1,1,:);
            E = reshape(E,[length(E) 1]);
        end
        res = [res E-min(E)];
        leg = [leg {l{i}.BlockPath.getBlock(1)}];
    end
    area(l{1}.Values.Time,res);
    xlabel('Time in s');
    ylabel('Energy in J');
    title('Energy Balance Timeline');
    legend(leg,'Location','eastoutside');
end
