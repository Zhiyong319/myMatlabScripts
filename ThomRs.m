function [Rs]=ThomRs(Rair,Pres,VPD,LE,T)

%ThomRs Calculate the canopy stomatal resistance (s/m) using equation by Thom(1975)
%Useage:
%    [Rs]=ThomRs(Rair,Pres,VPD,LE,T)
%
% Rair    : air density (kg m-3)
% Pres    : air pressure (kPa)
% VPD     : vapor pressure deficit(kPa)
% LE      : latent heat flux (w m-2)
% T       : temperature (degree C)
% Cp      : specific heat capacity at constant pressure (1005 J K-1 kg-1)
% Lv      : latent heat of vaporiation at 0 degree C (2.50e6 J kg-1)
% lambda  : latent heat of vaporiation (lambda (J kg-1)=Lv-2.3601e3*T(degree C))
% epsilon : ratio between the molecular weights of water vapor and air(0.622)
%Reference: Fowler, D., Flechard, C., Cape, J. N., Storeton-West, R. L., & Coyle, M. (2001). 
%           Measurements of ozone deposition to vegetation quantifying the flux, the stomatal 
%           and non-stomatal components. Water, Air, and Soil Pollution, 130(1-4), 63-74.

epsilon=18.02/28.97;

Lv=2.50e6;
lambda=Lv-2.3601e3*T;
E=LE./lambda; % kg m-2 s-1

Rs=Rair.*epsilon.*VPD./Pres./E;

end