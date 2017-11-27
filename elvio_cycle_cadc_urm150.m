function [data]=elvio_cycle_cadc_urm150()
% This function returns the speed data for the artemis (CADC) urban cycle.
    data = [elvio_cycle_cadc_urban();elvio_cycle_cadc_road();elvio_cycle_cadc_mw150()]; 
end