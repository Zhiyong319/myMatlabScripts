function [STheta_deg]=Cal_wdir_std(wdir)

%wdir_std Calculate the standard deviation of wind direction
%Following Yamartino, R.J. (1984). "A Comparison of Several "Single-Pass" Estimators of the Standard Deviation of Wind Direction". Journal of Climate and Applied Meteorology. 23 (9): 1362–1366
%Wiki link: https://en.wikipedia.org/wiki/Yamartino_method
%Useage:
%    [STheta_deg]=Cal_wdir_std(wdir)
%wdir: wind direction in degree
%STheta_deg: the standard deviation of wind direction in degree
%
%Translated from John Walker's SAS code
%                 -Zhiyong Wu, Aug 2018

DirR=wdir./180.*pi;                     % Convert wind direction to radians 
sa=sin(DirR); ca=cos(DirR);             % Calculate sin and cos
sa_ave=mean(sa); ca_ave=mean(ca);       % Calculate average of sin (sa_ave) and cos (ca_ave)
e=sqrt(1.0-(sa_ave.^2+ca_ave.^2));      % Calculate parameter for Yamartino method
STheta_rad=asin(e).*(1+0.1547.*(e.^3)); % standard deviation of wind direction in radians – Yamartino method
STheta_deg=STheta_rad./pi.*180;         % standard deviation of wind direction in degrees

end