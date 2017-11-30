function []=elvio_plot_sources(l)
% elvio_plot_sources(l)
%
% Plot the energy used from primary energy sources 
% over the parameter cases. 
%
%   l - logsout structure from Simulink
%
    res = [];
    leg = {};
    for i=1:l.numElements
        if isempty(regexp(l{i}.Name,'^E_store')), continue, end
        if isempty(regexp(l{i}.BlockPath.getBlock(1),'/Source/')), continue, end
        E = l{i}.Values.Data;       
        res = [res E(:,:,end)'];
        block = regexp(l{i}.BlockPath.getBlock(1),'/(?<name>\w+)/','names');
        leg = [leg {block.name}];
    end
    plot(1:size(res,1),res,'x-');
    xlabel('Case number');
    ylabel('Energy in J');
    title('Primary Energy Source Sensitivity');
    legend(leg,'Location','best');
end
