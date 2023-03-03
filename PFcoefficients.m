function [b0, b1, b2]=PFcoefficients(u,v,w) 

% PFcoefficients  Calculates the tilt coefficients for the planar fit coordinate
% Usage:
%      [b0, b1, b2]=PFcoefficients(u,v,w) 
%      u, v, and w should be 1 x N vector and do not include any NaNs.
%
%Written by Zhiyong Wu, Oct 2018, following Appendix A in Wilczak et al. (2001),SONIC ANEMOMETER TILT CORRECTION ALGORITHMS, Boundary-Layer Meteorology 99: 127–150, 2001. 

flen=length(u);
su=sum(u); % sums of velocities
sv=sum(v);
sw=sum(w);
suv=sum(u*v'); % sums of velocity products
suw=sum(u*w');
svw=sum(v*w');
su2=sum(u*u');
sv2=sum(v*v');
H=[flen su sv; su su2 suv; sv suv sv2]; % create 3 x 3 matrix
g=[sw suw svw]'; % transpose of g
x=H\g; % matrix left division
b0=x(1);
b1=x(2);
b2=x(3);

end