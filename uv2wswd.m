function [ws wd]=uv2wswd(u,v)

% UV2WSWD convert u and v components to windspeed and winddirection 
% U and V must be vectors.
% translated from G. Walters's fortran code(1974 / CSU - Atmos)
%
%Usage:
%      [ws wd]=uv2wswd(u,v)
%Designed by Zhiyong Wu, Jan 2010
%
%see also wswd2uv

rad2deg=180/3.1415926;

if abs(length(u)-length(v))>1e-2
    error('Lengths of U and V must be the same')
end

ws=sqrt(u.^2+v.^2);

wd=zeros(1,length(u))+NaN;

for n=1:length(u)
    if v(n)<0 && u(n)<0
        wd(n)=atan(u(n)/v(n))*rad2deg;
    end
    if v(n)<0 && u(n)>=0
        wd(n)=atan(u(n)/v(n))*rad2deg+360;
    end
    if v(n)==0 && u(n)<0
        wd(n)=90;
    end
    if v(n)==0 && u(n) ==0
        wd(n)=0;
    end
    if v(n)==0 && u(n)>0
        wd(n)=270;
    end
    if v(n)>0
        wd(n)=atan(u(n)/v(n))*rad2deg+180;
    end
end

end