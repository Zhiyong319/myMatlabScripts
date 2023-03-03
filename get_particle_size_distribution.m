function [DB,BINSIZE,FSIZE2]=get_particle_size_distribution(NSIZE,UB,DG,GSD)
% Get a particle size distribution profile assuming lognormal distribution
%
% Usage:
%       [BINSIZE,FSIZE]=get_particle_size_distribution(NSIZE,UB,DG,GSD)
%
% Output
% DB      - boundaries of size bin (um)
% BINSIZE - diameter of a size bin (um) (in Leiming's code, it is radius)
% FSIZE   - fraction (0-1) of a size bin
% Input:
% NSIZE - number of size bins
% UB    - particle size upper boundary (um)
% DG    - geometric mass mean diameter (um)
% GSD   - geometric standard deviation (unitless)

EINC = UB/NSIZE;
SGL =log(GSD);
RT2 = sqrt(2.0);

DB = nan(NSIZE+1,1);
BINSIZE = nan(NSIZE,1);
FSIZE = nan(NSIZE,1);

DB(1) = DG.*GSD.^(-UB*0.5);
for IB = 1:NSIZE
    DB(IB+1) = DG.*GSD.^(-UB.*0.5+IB.*EINC);
    BINSIZE(IB) = exp(log(DB(IB).*DB(IB+1)).*0.5);    % dimeter
    FSIZE(IB) = 0.5.*( erf(log(DB(IB+1)./DG)./(SGL.*RT2))-erf(log(DB(IB)./DG)./(SGL.*RT2)) );    
end

FSIZE2=FSIZE./sum(FSIZE);
end