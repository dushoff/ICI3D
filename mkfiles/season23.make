## This is a _linked_ (mkfile) Makefile for season23 (a branch of seasonalityProject)

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.R)

autopipeR = defined

TransmissionRatesEffectsPlots.Rout: TransmissionRatesEffectsPlots.R

beta.0_parms_plot.Rout: beta.0_parms_plot.R

seasonalObsSim.Rout: seasonalObsSim.R

fakeData.rds: fakeData.Rout ;
fakeData.Rout: fakeData.R sim_func.R

OptimizationFunction.Rout: OptimizationFunction.R

likelihood.Rout: likelihood.R fakeData.rds sim_func.R

######################################################################

## 2023 Jul 12 (Wed) Cheap branch control
## Only works with mkfiles; otherwise it won't be seen until not needed!

Makefile: 2023.setbranch

######################################################################

### Makestuff

## Sources += $(wildcard *.mk)
## include $(wildcard *.mk)

Ignore += Makefile
Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	ln -s ../makestuff .
	ls makestuff/Makefile

-include makestuff/os.mk

-include makestuff/pipeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
