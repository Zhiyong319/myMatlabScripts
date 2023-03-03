function [es]=SaturationVaporPressure(T,opt)

%SaturationVaporPressure Calculate the saturation vapor pressure (kPa) as a
%function of temperature (degrees Celsius)
%Useage:
%    [es]=SaturationVaporPressure(T,opt)
%
%Reference: 
% opt 1: eq. (26) in Shi et al. (2008), Comparison of methods for estimating 
%   evapotranspiration rate of dry forest canopy: Eddy covariance, Bowen ratio energy balance, and
%   Penman-Monteith equation. JOURNAL OF GEOPHYSICAL RESEARCH, 113,D19116.
% opt 2: http://www.shodor.org/os411/courses/_master/tools/calculators/satmixratio/index.html
%
%designed by Zhiyong Wu, Mar 07, 2016
%
%see also SaturationVaporPressure, VaporPressure, VaporPressureDeficit

switch (opt)
    case {1}
        
        a=0.611;  % kPa
        b=17.502; % 
        c=240.97; % degree C

        es=a*exp(b*T./(T+c));
        
    case {2}
        
        a=0.611;  % kPa
        b=7.5;    % 
        c=237.3;  % degree C

        es=a*10.^(b*T./(T+c));
        
    otherwise
        disp('The opt value MUST be 1 or 2');
end