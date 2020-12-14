%% This script uses the agr_phyto.m function to 
% calculate the apparent growth rate of a the phytoplankton within a volume
% of water (in 24 hours).
% alice.dellapenna@gmail.com 2020/12/14
%%

% setting up the parameters

time_experiment = 24*60*60;
D_vals = [10^-10,10^-8,10^-7];
dilutions = [12.5,25,50,75,87.5,100];
volume = 0.2;
conc = 10^3;
num_exp = 10;
hv_ratio =10;

for kk=1:num_exp
    for pp=1:length(dilutions)
        for jj =1 :length(D_vals)
            [agr(pp,jj,kk),~] = agr_phyto(volume, dilutions(pp),conc,hv_ratio,D_vals(jj),time_experiment);
        end
    end
end