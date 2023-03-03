function [pv]=Qv2Pv(qv,pres)

% Qv2Pv convert water vapor mixing ratio (Qv, kg/kg) to water vapor pressure (Pv, Pa) 
% water vapor mixing ratio is the mass of water vapor per mass of dry air 
%Usage:
%      [pv]=Qv2Pv(qv,pres)
%      pres: atmospheric pressure (Pa)
%
%Designed by Zhiyong Wu, 2013/02
%
%see also Qv2Pv, Qv2RH, RH2Qv

pv=pres.*qv./(0.622+qv);

end