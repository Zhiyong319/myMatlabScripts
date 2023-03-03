function [d, z0]=DHandZ0(Hc, LAI, P)

%DHandZ0 Calculate displacement height(D) and roughness length(z0) following Eq. 7&8 of Meyers et al. (1998), JGR
%Useage:
%    [d, z0]=DHandZ0(Hc, LAI, P)
%Hc:  Canopy height (m)
%LAI: leaf area index (m2/m2)
%P:   Type of presumed LAD profile (1,2, or 3)
%
%%designed by Zhiyong Wu, July 2018

d =Hc.*(0.05+LAI.^0.20/2+(P-1)/20);
z0=Hc.*(0.23-LAI.^0.25/10-(P-1)/67);

end



