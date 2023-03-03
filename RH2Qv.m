function [qv]=RH2Qv(t,rh,pres,opt)
% RH2Qv calculate Water vapor mixing ratio (kg kg-1) as a function of temperature (K),
% relative humidity (%), and pressure (Pa).
% There are two methods and you can switch them using opt(1 or 2).
% opt=2 is the algorithm used in ncl (wrf_rh) 
%
%Usage:
%      [qv]=RH2Qv(t,rh,pres,opt)
%
%Designed by Zhiyong Wu, Mar 14, 2014
%
%see also Qv2Pv, Qv2RH, RH2Qv

switch (opt)
    case {1}    
        es=610.78*10.^(7.5*(t-273.15)./(t-36.16));
        e=es.*rh/100;
        qv=0.622*e./(pres-e);        
    case {2}
        es=6.112.*exp(17.67.*(t-273.15)./(t-29.65));
        qvs=0.622.*es./(pres./100.0-(1.0-0.622).*es);
        qv=qvs.*rh/100.; 
    otherwise
        disp('The opt value MUST be 1 or 2');
end

end