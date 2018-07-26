function [sys,x0,str,ts,simStateCompliance] = elvio_display_sfct(t,x,u,flag,d)
sys=[];
switch flag
    case 0 % Initialization %
        [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes();
    case 3 % Outputs %
        sys=u;
        maybeupdate(u,t,d);
    case 4 % GetTimeOfNextVarHit %
        sys=t+1;
    case 6 % Direct feed through %
        sys=1;
    case 9 % Terminate %
        sys=u;
        update(u);
end
end

function update(u)
    set_param(get_param(gcb,'parent'),'MaskDisplay',...
        ['disp(''' sprintf('%0.3e',u(1)) ''')']);
end

function maybeupdate(u,t,d)
    if abs(mod(t,d))<1e-6
        update(u);
    end
end
%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes()
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = -1;
sizes.NumInputs      = -1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed
sys = simsizes(sizes);
x0 = [];
str = [];
ts  = [0 0];
simStateCompliance = 'HasNoSimState';
end