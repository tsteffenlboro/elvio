function []=elvio_tag_goto(port)
% Set the receiving part of a reverse connection.
% The parameter is a vector of input port numbers. 
    % get the connectivity list
    pc = get_param(gcb,'PortConnectivity');
    for i=port
        is = mat2str(i);
        % follow the connectivity of port i
        pci = pc(i);
        % tag name: the connected port name followed by the port number
        set_param(gcb,['GotoTag' is],...
            [get_param(pci.SrcBlock,'name') mat2str(pci.SrcPort+1)]);
    end
end
