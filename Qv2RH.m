function [rh]=Qv2RH(t,qv,pres,opt)
% Qv2RH calculate relative humidity (%) as a function of temperature (K), 
% water vapor mixing ratio (kg kg-1), and pressure (Pa)
% Qv = mass weight ratio of water vapor and dry air
% Specific humidity (SH) = mass weight ratio of water vapor and all the air
% SH=Qv/(1+Qv); Qv=SH/(1-SH)
% There are two methods and you can switch them using opt(1 or 2).
% opt=2 is the algorithm used in ncl (wrf_rh) 
%
%Usage:
%      [rh]=Qv2RH(t,qv,pres,opt)
%
%Designed by Zhiyong Wu, Jan 2013
%
%see also Qv2Pv, Qv2RH, RH2Qv

switch (opt)
    case {1}    
        e=pres.*qv./(0.622+qv);
        es=610.78*10.^(7.5*(t-273.15)./(t-36.16));
        rh=e./es*100;
    case {2}
        es=6.112.*exp(17.67.*(t-273.15)./(t-29.65));
        qvs=0.622.*es./(pres./100.0-(1.0-0.622).*es);
        rh=100.*qv./qvs; 
    otherwise
        disp('The opt value MUST be 1 or 2');
end

end
