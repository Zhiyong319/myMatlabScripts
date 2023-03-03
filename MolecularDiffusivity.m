function Dc=MolecularDiffusivity(T, MW)

%Calculate Molecular diffusivity of gas at temperature T(K) following Leiming's code


dair=0.369*29.+6.29;
dh2o=0.369*18.+6.29;
dgas=0.369*MW+6.29;

Dc=0.001*T.^1.75*sqrt((29.+MW)./MW/29.)/1.0/(dair.^0.3333+dgas.^0.3333).^2;

end

