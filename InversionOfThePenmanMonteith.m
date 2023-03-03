function [Rs]=InversionOfThePenmanMonteith(LE, delta, A, AirDen, VPD, Ra, gamma)

%InversionOfThePenmanMonteith Calculate the canopy stomatal resistance using the inversion of the 
% Penman-Monteith equation.
%Useage:
%    [Rs]=InversionOfThePenmanMonteith(LE, delta, A, AirDen, vpd, RA, gamma)
%
% LE     : latent heat flux (w m-2)
% delta  : the slope of the saturation vapor pressure-temperature relationship (kPa K-1)
% A      : the available energy (w m-2), A = swin-swout+lwin-lwout-Gt (soil heat flux)
% AirDen : air density (kg m-3)
% VPD    : vapor pressure deficit(kPa)
% Ra     : aerodynamic resistance (s m-1)
% gamma  : the psychrometric constant (kPa K-1)
% Cp     : Specific heat capacity at constant pressure (1005 J K-1 kg-1)
%
%designed by Zhiyong Wu, Mar 08, 2016
%
%see also SaturationVaporPressure, VaporPressure, VaporPressureDeficit, PsychrometricC

Cp=1005;

part1=delta.*A+AirDen.*Cp.*VPD./Ra;
part2=(part1./LE-delta)./gamma;
Rs=(part2-1).*Ra;

end
