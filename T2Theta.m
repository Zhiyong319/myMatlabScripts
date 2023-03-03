function [theta]=T2Theta(P, T)

%T2Theta Convert temperature T(K) at pressure P (Pa) to potential temperature(K) 
%Previous name: CalTheta
%Useage:
%       [theta]=T2Theta(P, T)
%
% R    : Specific gas constant for dry air (287 J K-1 kg-1) 
% Cp   : Specific heat capacity at constant pressure (1005 J K-1 kg-1)
% p0   : Standard surface pressure (101325 Pa)
% k    : constant (R/Cp)
%
%designed by Zhiyong Wu, Apr 22, 2011

R=287;
Cp=1005;
k=R/Cp;
p0=101325;

theta=T.*(p0./P).^k;

end