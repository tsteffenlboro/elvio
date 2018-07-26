function []=elvio_plot_scatter(l)
% elvio_plot_scatter(l)
%
% Draw a scatter plot and cumulative histograms for logged connections.
% The plot is drawn as power over speed. 
% 
%   l - logsout structure from Simulink
%
    close all
    for i=1:l.numElements
        if regexp(l{i}.Name,'^E_'), continue, end  
        b = l{i}.BlockPath.getBlock(1);
        if length(regexp(b,'/'))>1, continue, end  
        V = l{i}.Values;
        if ~isfield(V,'F'), continue, end
        f = V.F.Data;
        v = (V.v.Data+V.v_.Data)./2;
        if length(size(f))>2
            f=squeeze(f)';
            v=squeeze(v)';
        end
        p = f.*v;
        figure;
        subplot(2,2,2);
        plot(v,p,'x');
        %plot([V.v.Data V.v_.Data]',[V.F.Data V.F.Data]','-xk');
        xlabel('Speed');
        ylabel('Power in W');
        title(regexprep(b,'_',' '));
        
        elvio_plot_cumsum(1,v,'Speed');
        title('Cumulative Histogram');
        elvio_plot_cumsum(3,f,'Force/Torque');
        elvio_plot_cumsum(4,p,'Power in W');
        leg = ['1':'9' 'a':'z' 'A':'Z']';
        leg = mat2cell(leg(1:size(v,2),1),size(v,2),1);
        leg = legend(leg,'Location','southeast');
        title(leg,'Case');
    end
end

function []=elvio_plot_cumsum(s,x,l)
    subplot(2,2,s);
    for i=1:size(x,2)
        x(:,i)=sort(x(:,i));
    end
    ns=0.75:0.5:size(x,1)+0.5;
    plot(ceil(ns),x(round(ns),:));
    xlabel('Time in s');
    ylabel(l);
end
