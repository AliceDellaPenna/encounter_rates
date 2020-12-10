# Scripts for the Knowles et al. manuscript 
We will insert here the complete reference to the manuscript
Please contact Alice Della Penna (alice.dellapenna<at>gmail.com) for any questions and to report errors

## Goal
This set of Matlab/Octave scripts calculates: 
- the probability of a phytoplankton cell of encountering the walls of a container after a given time interval
- the probability of a phytoplankton cell of encountering randomly distributed viruses after a given time interval
- the apparent growth rate (AGR) of a phytoplanktonic community confined in a volume of water 

## Parameters for the calculations

- `time_experiment` = duration of the numerical experiment (in seconds)
- `D_vals` = values of diffusion coefficient for the phytoplankton cells (in cm<sup>2</sup> s<sup>-1</sup>)
- `dilutions` = dilution levels used (in %)
- `volume` = volume of the container where the numerical experiment is set (in cm<sup>3</sup>) 
- `conc` = concentration of phytoplankton cells (in # cm<sup>-3</sup>)
- `num_exp` = number of replicates for the numerical experiment 
- `hv_ratio` = virus:host ratio 

## Scripts

- `exit_time_diffusive.m` : function that calculates the probability of encountering the wall given volume,concentration, dilution level, diffusion coefficient and duration of the experiment
- `virus_phyto_encounter.m` : function that calculates the probability of encountering the wall given volume,concentration, virus to host ratio, dilution level, diffusion coefficient and duration of the experiment
- `agr_phyto.m` : function that calculates the apparent growth rate given volume, concentration, virus to host ratio, dilution level, diffusion coefficient and duration of the experiment
- `gh_wall_encounter.m` : main wall-encounter experiment, running `exit_time_diffusive.m` for different diffusion coefficients, dilution levels and for a given number of replicates
- `gh_virus_encounter.m` : main wall-encounter experiment, running `virus_phyto_encounter.m` for different diffusion coefficients, dilution levels and for a given number of replicates
- `gh_agr.m` : main agr experiment, running `agr_phyto.m` for different diffusion coefficients, dilution levels and for a given number of replicates

## Assumptions

1. Phytoplankton cells have uniform diffusion coefficients and are distributely randomly within the volume
2. Volumes are assumed to be cubes for the virus encounter and apparent growth rate experiments and spherical in the wall-encounter experiment
3. Viruses are assumed to be randomly distributed within the volume at any given time
4. When phytoplankton cells encountered the walls of the container they stick to the walls and eventually die

[![License: CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc/4.0/)
