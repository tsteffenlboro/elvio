function []=elvio_plot_energy(l)
% elvio_plot_energy(l)
% Plot energy storage over time as a waterfall diagram. 
%
%   l - logsouts structure from Simulink
    res = [];
    leg = {};
    for i=1:l.numElements
        name = l{i}.Name;
        if isempty(regexp(name,'^E_')), continue, end
        E = l{i}.Values.Data;
        if length(size(E))>2
            E=squeeze(E)';
        end
        res = [res E(:,1)-min(E(:,1))];
        n = l{i}.BlockPath.getBlock(1);
        n = regexp(n,'^[a-zA-Z0-9_]+/(?<path>.+)/[a-zA-Z0-9_]+$','names');
        leg = [leg {n.path}];
    end
    area(l{1}.Values.Time,-res);
    xlabel('Time in s');
    ylabel('Energy in J');
    title('Energy Balance Timeline');
    legend(leg,'Location','eastoutside');
end
