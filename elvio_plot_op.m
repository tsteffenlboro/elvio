function []=elvio_plot_op(v,f,col)
    vv = reshape(v',numel(v),1);
    ff = [f f];
    ff = reshape(ff',numel(ff),1);
%    ff = ([ff;0]+[0;ff])/2;
%    vv = ([vv;0]+[0;vv])/2;
    plot(vv,vv.*ff,['x:' col]);
    hold on
    s = [sortrows([v f]); -1 -1 -1];
    j = s(1,:);
    c = 0;
    for i = s'
        if max(abs(i-j))<1e-10
            c = c + 1;
        else
            if c>0
                plot(j(1),j(1).*j(3),['*' col],'MarkerSize',c^0.5,'LineWidth',c^0.5/5);
                [j(1) j(3) c]
            end
            c = 0;
            j = i;
        end
    end
    xlabel('Speed in rad/s');
    ylabel('Power in W');
%   hold off
end