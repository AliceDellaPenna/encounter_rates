%% This script uses the exit_time_diffusive.m function to 
% calculate the probability of a phytoplankton cell hitting a wall within
% 24 h. We use 10 replicates
% alice.dellapenna@gmail.com 2020/12/14
%%

% setting the parameters
time_experiment = 24*60*60;
D_vals = [10^-10,10^-8,10^-7];
dilutions = [12.5,25,50,75,87.5,100];
volume = 0.2; 
conc = 10^3;
num_exp = 10;

for kk=1:num_exp % we replicate 10 times
    for jj = 1:length(dilutions)
        for pp = 1:length(D_vals)
        prc_wall(jj,pp,kk) = exit_time_diffusive(dilutions(jj), volume, conc,D_vals(pp),time_experiment);
        end
    end
end % closes on replicates
