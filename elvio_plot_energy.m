function []=elvio_plot_energy_waterfall(logsout)
    n = logsout.numElements;
    ts = logsout{1}.Values.Time;
    res = [];
    for i=1:n
        name = logsout{i}.Name;
        if regexp(name,'^E_')
            E = logsout{i}.Values.Data;
            E = E(:,1);
            res = [res E-min(E)];
        end;
    end
    area(ts,res);
    xlabel('Time in s');
    ylabel('Energy in J');
    title('Energy Balance Timeline');
end
