function []=elvio_plot_sources_xy(l)
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
    plot(res(:,2),res(:,1),'x-');
    for i=1:size(res,1)
        text(res(i,2),res(i,1),int2str(i));
    end
    xlabel(leg{2});
    ylabel(leg{1});
    title('Primary Energy Source Trade-Off in J');
    axis equal
    grid
end
