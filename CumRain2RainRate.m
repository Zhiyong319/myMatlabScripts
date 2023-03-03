function PR = CumRain2RainRate (PC,PC_t0)
% CumRain2RainRate: Calculate Precipitation Rate from time series of Cumulative Precipitation
%   Usage: PR = CumRain2RainRate (PC,PC_t0)
%   If Cumulative Precipitation at t0 is not know, set PC_t0 = PC(1)
%
% Designed by Zhiyong Wu, Oct/13/2020

if any(isnan(PC))
    
    disp(['!!! PC includs ',num2str(sum(isnan(PC))),' NaNs, at indices: ']); 
    disp(find(isnan(PC)))
    
    for n=1:length(PC)
    if isnan(PC(n))
        if n==1
            PC(n)=0;
        else
            PC(n)=PC(n-1);
        end
    end
    end

    disp('*** The NaNs are fixed ***')
end
    
n=length(PC);
PR(1)=PC(1)-PC_t0;
PR(2:n)=diff(PC);

if any(PR<0)
    disp(['!!! There are ',num2str(length(find(PR<0))),'/',num2str(length(PR)),' negative values']);
    disp('Summary Table of the negative values')
    tabulate(PR(PR<0))
    
    figure(3),clf,plot(PC)
    
    PR(PR<0)=0;
    disp('*** The negative values are forced to 0 ***')
end
 
end