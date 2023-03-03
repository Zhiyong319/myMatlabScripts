function [delta]=SlopeOfSVPandT(T)

%SlopeOfSVPandT Calculate the slope of the saturation vapor
%pressure-temperature relationship (kPa/degree C) as a function of temperature (degrees Celsius).
%Useage:
%    [delta]=SlopeOfSVPandT(T)
%
%Reference: eq. (28) in Shi et al. (2008), Comparison of methods for estimating 
%evapotranspiration rate of dry forest canopy: Eddy covariance, Bowen ratio energy balance, and
%Penman-Monteith equation. JOURNAL OF GEOPHYSICAL RESEARCH, 113,D19116.
%
%designed by Zhiyong Wu, Mar 07, 2016
%
%see also SaturationVaporPressure, VaporPressure, VaporPressureDeficit
%
%An alternative formulation is used with Staghellini equation (ASAE Standards, 1998): delta=0.04145*exp(0.06088*T)

a=0.611;  % kPa
b=17.502; % 
c=240.97; % degree C

es=a*exp(b*T./(T+c));

delta=b*c*es./((c+T).^2);

end


        

