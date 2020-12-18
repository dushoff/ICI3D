
## This is the dp2020 _subdirectory_ of ICI3D

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

## questions.filemerge
Sources += questions.md

######################################################################

### Makestuff

Sources += Makefile

Makefile: makestuff/Makefile
makestuff/Makefile:
	cd .. && $(MAKE) makestuff
	ln -s ../makestuff .
	ls makestuff/Makefile

-include makestuff/os.mk

## -include makestuff/makeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
