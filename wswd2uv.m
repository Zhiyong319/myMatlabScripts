function [u v]=wswd2uv(ws,wd)

% WSWD2UV convert windspeed and winddirection to u and v components
%Usage:
%      [u v]=wswd2uv(ws,wd)
%Designed by Zhiyong Wu, Jan 2010
%
%see also uv2wswd

pi=3.1415926;

u=ws.*sin((wd-180)*pi/180);
v=ws.*cos((wd-180)*pi/180);

end