function [L]=Calmol(Rair, ustar, thet, H)

%Calmol Calculate Monin-Obukhov Length (m)
%Useage:
%    [L]=Calmol(Rair, ustar, thet, H)
%
% Rair : Air density (kg m-3)
% ustar: Friction velocity (m s-1)
% thet : Potential temperature (K)
% H    : Sensible heat flux (W m-2)
% k    : von Karman's constant (0.4)
% g    : Gravitation acceleration (9.81 m s-2)
% Cp   : Specific heat capacity at constant pressure (1005 J K-1 kg-1)
%
%designed by Zhiyong Wu, Apr 22, 2011
%revised, March 1, 2018

k=0.4;
g=9.81;
Cp=1005;

L=-1.*Cp.*Rair.*((ustar+eps).^3).*thet./(H+eps)./k./g;

end