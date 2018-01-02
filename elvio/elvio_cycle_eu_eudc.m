function [data] = elvio_cycle_eu_eudc()
% Drive cycle data for the EUDC highway cycle.
% Taken from UNECE Regulation 83 revision 5.
% All gear shifts take place over 2 seconds, typically at constant spead. 
% The result has three rows:
% speed    - vehicle speed in m/s.
% duration - duration of a step in seconds.
% gear     - specified gear.
    data = [18 0 0;2 0 1;...
        5 15 1;2 15 2;9 35 2;2 35 3;8 50 3;2 50 4;...
        13 70 4;2 70 5;48 70 5;3 62.5 5;2 57.5 4;3 50 4;69 50 4;...
        13 70 4;2 70 5;48 70 5;...
        35 100 5;30 100 5;20 120 5;10 120 5;16 80 5;8 50 5;1 45 0;...
        9 0 0;20 0 0];
    % convert from km/h into m/s
    data(:,2) = data(:,2)./3.6;
end