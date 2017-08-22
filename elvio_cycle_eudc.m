function [data] = elvio_cycle_eudc()
% Drive cycle data for the EUDC highway cycle. 
% The result has three rows:
% speed    - vehicle speed in km/h.
% duration - duration of a step in seconds.
% gear     - specified gear.
    data = [20 0 0;...
        5 15 1;2 15 2;9 35 2;2 35 3;8 50 3;2 50 4;...
        13 70 4;50 70 5;8 50 4;69 50 4;13 70 4;50 70 5;...
        35 100 5;30 100 5;20 120 5;10 120 5;16 80 5;8 50 5;10 0 0;...
        20 0 0];
end