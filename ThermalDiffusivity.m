function Dthet=ThermalDiffusivity(T)

%Calculate thermal diffusivity of air at temperature T(K) following Leiming's code

% parameters for air dynamic properties
ROAROW = 1.19;

Dthet=145.8e-4*T.^1.5./(T+110.4)/ROAROW;

end

