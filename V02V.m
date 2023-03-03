function V=V02V(P,T)

% FUNCTION  V02V
% modulate the constant 22.4 in the standard condition(1.01325e5Pa & 273.15K)
% according to P(Pa) and T(K)
%useage:
%       V=V02V(P,T)

P0=1.01325e5;
T0=273.15;
V0=22.4;

V=P0./P.*T./T0.*V0;

end




