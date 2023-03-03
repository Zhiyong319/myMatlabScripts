function [gamma]=PsychrometricC(P,T)

%PsychrometricC Calculate the psychrometric constant (kPa/K) as a function of atmospheric pressure (kPa).
%The latent heat of vaporiation (lambda) is calculated as a function of temperature(degree C).
%Useage:
%    [gamma]=PsychrometricC(P,T)
%
%Reference: eq. (7) in Shi et al. (2008), Comparison of methods for estimating 
%evapotranspiration rate of dry forest canopy: Eddy covariance, Bowen ratio energy balance, and
%Penman-Monteith equation. JOURNAL OF GEOPHYSICAL RESEARCH, 113,D19116.
%
% Cp      : Specific heat capacity at constant pressure (1005 J K-1 kg-1)
% Lv      : latent heat of vaporiation at 0 degree C (2.50e6 J kg-1)
% lambda  : latent heat of vaporiation (lambda (J kg-1)=Lv-2.3601e3*T(degree C))
% epsilon : ratio between the molecular weights of water vapor and air(0.622)
%
%designed by Zhiyong Wu, Mar 08, 2016
%
%see also SaturationVaporPressure, VaporPressure, VaporPressureDeficit

Cp=1005;
Lv=2.50e6;
epsilon=18.02/28.97;

lambda=Lv-2.3601e3*T;

gamma=Cp*P./lambda/epsilon;

end