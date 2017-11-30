function []=elvio_tag_from(port)
% Set the receiving part of a reverse connection.
% The parameter is a vector of output port numbers. 
    name = get_param(gcb,'Name'); % get the block name
    for i=port
        % set the tag to the block name followed by the port number
        is = mat2str(i);
        set_param(gcb,['FromTag' is],[name is]);
    end
end