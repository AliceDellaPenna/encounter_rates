%% exit_time_diffusive.m
% This script estimates the percentage of phytoplankton cells that would
% have hit the walls of a container of a given volume after a certain
% amount of time.
% The script is extremely simple and uses the definition of the diffusion
% coefficient associated to the phytoplankton cells
% 2020/12/09 - alice.dellapenna@gmail.com 

% inputs: - dilution_factor (as a %)
%         - V = volume of the experiment in cm3
%         - concentration = phytoplankton concentration in #/cm3
%         - D = diffusion coefficient in cm2/s
%         - t= time_experiment = duration of the experiment in seconds
% output: prc_wall = percentage of phytoplankton cells stuck against the
% wall after the experiment

function prc_wall = exit_time_diffusive(dilution_factor, V, concentration,D,t)


Np = dilution_factor./100.*V*concentration; %first calculates the number of phytoplankton cells
phyto_radii = rand(round(Np),1); % and extract the appropriate number of random locations


R = (3*V./pi./4)^(1./3); % we calculate the radius of the equivalent sphere
r = phyto_radii.*R; % location of each phytoplankton within that radius

R_an = sqrt(D.*t); % this is the size of the radius that each phytoplankton cell will explore within a time t

cip = find((r+R_an)>R); % we find all the cells that, given their initial location, will exceed the total radius of the sphere
prc_wall = length(cip)./length(r)*100; % and compute which percentage of the total they represent
end
