function [argout]=ugm32ppbv(argin,mw,pres,t)

%UGM32PPBV convert ug/m3 to ppbv
%Useage:
%    [argout]=ugm32ppbv(argin,mw,pres,t)
%    argin: ug/m3
%    mw: molecular weight (g/mol)
%    pres: Pa
%    t: K
%    argout: ppbv
%
%designed by Zhiyong Wu, 2013/02
%
%see also ppbv2ugm3

P0=1.01325e5; % Pa
T0=273.15;    % K
V0=22.4;      % L/mol 

argout=argin.*(V0.*P0.*t./mw./pres./T0);

end
