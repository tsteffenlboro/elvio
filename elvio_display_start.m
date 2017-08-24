function [h]=elvio_display_start()
    g = gcb;
    set_param(g,'MaskDisplay',['disp(''' '-' ''')']);
    h = add_exec_event_listener([g '/Display'], 'PostOutputs', @(blk,ev)update(blk,g)); 
end

function []=update(blk,g)
    set_param(g,'MaskDisplay',['disp(''' sprintf('%0.3e',blk.InputPort(1).Data) ''')']);
end