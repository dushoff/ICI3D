## This is the Workshop videos git _subdirectory_

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

## Dropbox subdirectories

## mkdir ~/Dropbox/Workshops/edited_videos ##
drop: dl out

dl: dir = ~/Dropbox/Workshops/videos
dl:
	$(linkdirname)

out: dir = ~/Dropbox/Workshops/edited_videos
out:
	$(linkdirname)
out/%: out
out/Foundations.clip1.mp4: dl/Foundations17.mp4 Makefile
	ffmpeg -y -i $< -ss 5 -to 830 -acodec copy $@

######################################################################

### Makestuff

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff

## Want to chain and make makestuff if it doesn't exist
## Compress this ¶ to choose default makestuff route
Makefile: makestuff/Makefile
makestuff/Makefile:
	cd .. && $(MAKE) makestuff
	ln -s ../makestuff .
	ls makestuff/Makefile

-include makestuff/os.mk

## -include makestuff/makeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
