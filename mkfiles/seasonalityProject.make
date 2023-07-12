## This is a _linked_ (mkfile) Makefile for Seasonality Project

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

autopipeR = defined

Sources += $(wildcard *.R)

Sources += README.md

Sources += $(wildcard *.R)
viewData.Rout: viewData.R simulatedData.Rdata
	$(pipeR)

explore.Rout: explore.R

compareOutputs.Rout: compareOutputs.R 

seasonalData.Rout: seasonalData.R

## check.probSeasonalObs.func.Rout: check.probSeasonalObs.func.R
## peakshift.Rout: peakshift.R

######################################################################

## JD version (no good reason for this to exist yet)

newsim.Rout: newsim.R

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
-include makestuff/gitbranch.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
