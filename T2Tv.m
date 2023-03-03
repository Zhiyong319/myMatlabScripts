function [Tv]=T2Tv(T,Qv,Ql,opt)

%T2Tv convert temperature T(K) at water vapor mixing ratio Qv(kg kg-1) and liquid water mixing ratio Ql(kg kg-1)
%to virtual temperature Tv(K)  
%Previous name: CalTv
%Useage:
%       [Tv]=T2Tv(T,Qv,Ql,opt)
%
%designed by Zhiyong Wu, Mar 19, 2014

switch (opt)
    case {1}
        Tv=T.*(1+0.61.*Qv-Ql);
    case {2}
        eps=18.02/28.97;
        Tv=T.*(1+Qv./eps)./(1+Qv+Ql);   
    otherwise
        disp('The opt value MUST be 1 or 2');
end

end