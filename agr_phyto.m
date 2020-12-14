%% agr_phyto_encounter.m
% This script calculates the apparent growth rate (AGR) of a phytoplankton
% sample confined in a volume V
% The script is not designed for efficiency
% 2020/12/14 - alice.dellapenna@gmail.com 

% inputs: - dilution_factor (as a %)
%         - V = volume of the experiment in cm3
%         - concentration = phytoplankton concentration in #/cm3
%         - D = diffusion coefficient in cm2/s
%         - t= time_experiment = duration of the experiment in seconds
%         - hv_ratio = virus:host ratio
% output: agr = apparent growth rate
%         hit = is a vector containing whether the phytoplankton cell
%         encountered a virus (=1) or a wall first (=2). If hit is = 0,
%         then the cells hasn't encountered a wall or a virus for the
%         duration of the numerical experiment
% assumption = th_distance = 5*10^-4; --> this code is based on E.huxley
% and this numer needs to change if we are considering larger or smaller
% cells

function [agr,hit] = agr_phyto(V, dilution_factor,conc,hv_ratio,diffusion_coeff,dt)


Np = int32(dilution_factor./100.*V*conc); %
Nv = int32(Np.*hv_ratio);

max_swimspeed = sqrt(diffusion_coeff); %using now data from Karen in cm
scale_factor = max_swimspeed;

th_distance = 5*10^-4; % in cm this is how close phytoplankton has to get to a virus before having effects
% using 5 um that is the size of E. huxleyi


%% We seed randomly the viruses -  the positions are normalized over the volume

virus_locs_tmp = rand(3,Nv); % the position is extracted randomly from a uniform distribution
virus_locs = virus_locs_tmp./max(abs(virus_locs_tmp(:))).*V^(1./3); % normalizing over the volume

%% And we seed randomly the phytoplankton

phyto_locs_tmp = rand(3,Np);
phyto_locs = phyto_locs_tmp./max(abs(phyto_locs_tmp(:))).*V^(1./3); % normalizing over the volume



%% Now we "animate" the phytoplankton, one cell at a time
hit = zeros(Np,1);

for pp = 1:Np
    clear tmp_pos
    dt_count = 1;
    while hit(pp)<1 & dt_count<=dt % as long as we are not hitting the walls or have been hit by a virus
        dt_count = dt_count+1;
        dW = randn(3,1); % generate random displacement
        sgnW = randn(1,1); % and a random direction
        if sgnW>=0.5 sgn=1;
        elseif sgnW<0.5 sgn=-1;
        end
        
        tmp_pos = phyto_locs(:,pp)+sgn*dW*scale_factor; % and calculate new location
        
        
        hits_side = find(tmp_pos >= V.^(1/3) |  tmp_pos <= 0); % we now check if we have hit the wall
        phyto_locs(:,pp)=tmp_pos;  % and update the position
        disty = sqrt((phyto_locs(1,pp)-virus_locs(1,:)).^2+(phyto_locs(2,pp)-virus_locs(2,:)).^2+(phyto_locs(3,pp)-virus_locs(3,:)).^2); % and use it to calculate the distance to all the viruses
          encounter = find(disty<=th_distance); % if the host got in contact with any virus we hit the alarm!
        
        if ~isempty(encounter) % if phytoplankton encounters at least one virus
        %    disp('encounter!')
        hit(pp) = 1;
        end
        
        if ~isempty(hits_side) % if phytoplankton has hit the wall
            %disp('wall!')
            
            hit(pp)=2; % and we put to 0 the hit map for that host at that simulation
        end
        
    end
    
    
    
    
end % closes loop on hosts

agr = log(length(find(hit==0))./length(hit));


end