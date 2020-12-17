## This is the Workshop videos git _subdirectory_

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

## Dropbox subdirectories

## mkdir ~/Dropbox/Workshops/edited_videos ##
drop =  dl out zoom

drop: $(drop)

Ignore += $(drop)

dl: dir = ~/Dropbox/Workshops/videos
dl:
	$(linkdirname)

zoom: dir = ~/Dropbox/Zoom
zoom:
	$(linkdirname)

out: dir = ~/Dropbox/Workshops/edited_videos
out:
	$(linkdirname)

######################################################################

## Foundations MMED 2017 (and intro sub-video)
out/Foundations.clip1.mp4: dl/Foundations17.mp4
	ffmpeg -y -i $< -ss 5 -to 830 -acodec copy $@

Ignore += *.mp4

## Foundations DAIDD 2020 (just the Discussion part)
Foundations.Discuss.0.mp4: zoom/family/zoom_0.mp4
	ffmpeg -y -i $< -ss 4 -to 235 -acodec copy $@

Foundations.Discuss.1.mp4: zoom/family/zoom_0.mp4
	ffmpeg -y -i $< -ss 260 -to 585 -acodec copy $@

Foundations.Discuss.2.mp4: zoom/family/zoom_0.mp4
	ffmpeg -y -i $< -ss 1153 -to 1386 -acodec copy $@

Foundations.Discuss.3.mp4: zoom/family/zoom_0.mp4
	ffmpeg -y -i $< -ss 1522 -to 1940 -acodec copy $@

out/Foundations.Discuss.edit.mp4: Foundations.Discuss.0.mp4 Foundations.Discuss.1.mp4 Foundations.Discuss.2.mp4 Foundations.Discuss.3.mp4 Foundations.Discuss.comb.txt

## Heterogeneity DAIDD 2020
Het.Frame.0.mp4: zoom/het1/zoom_0.mp4
	ffmpeg -y -i $< -ss 15 -to 154 -acodec copy $@
Het.Frame.1.mp4: zoom/het1/zoom_0.mp4
	ffmpeg -y -i $< -ss 204 -to 341 -acodec copy $@
Het.Frame.2.mp4: zoom/het1/zoom_0.mp4
	ffmpeg -y -i $< -ss 438 -to 692 -acodec copy $@
Het.Frame.3.mp4: zoom/het1/zoom_0.mp4
	ffmpeg -y -i $< -ss 818 -to 1170.5 -acodec copy $@
Het.Frame.4.mp4: zoom/het1/zoom_0.mp4
	ffmpeg -y -i $< -ss 1225 -to 1285 -acodec copy $@
Het.Frame.5.mp4: zoom/het1/zoom_0.mp4
	ffmpeg -y -i $< -ss 1333 -to 1700 -acodec copy $@
## DIFFERENT source file
Het.Frame.6.mp4:  zoom/het2/zoom_2.mp4
	ffmpeg -y -i $< -ss 15 -to 1577 -acodec copy $@

out/Het.Frame.edit.mp4: Het.Frame.0.mp4 Het.Frame.1.mp4 Het.Frame.2.mp4 Het.Frame.3.mp4 Het.Frame.4.mp4 Het.Frame.5.mp4 Het.Frame.6.mp4 Het.Frame.comb.txt

######################################################################

## Assessment

Assessment.0.mp4: zoom/assessment1/zoom_0.mp4
	ffmpeg -y -i $< -ss 3 -to 1092 -acodec copy $@

Assessment.1.mp4: zoom/assessment1/zoom_4.mp4
	ffmpeg -y -i $< -ss 24 -to 1187 -acodec copy $@

Assessment.2.mp4: zoom/assessment2/zoom_0.mp4
	ffmpeg -y -i $< -ss 4 -to 696 -acodec copy $@

out/Assessment.edit.mp4: Assessment.0.mp4 Assessment.1.mp4 Assessment.2.mp4 Assessment.comb.txt

######################################################################

## Rules for making and using concat
## Work on comb.txt depedencies combine * and %?
.SECONDEXPANSION:
%.comb.txt: $$(wildcard $$*.?.mp4)
	ls $*.?.mp4 | perl -npe "s/.*/file '$$&'/" >  $@
%.edit.mp4:
	touch $@; $(MVF) $@ $*.tmp.mp4
	ffmpeg -f concat -i $(filter %.txt, $^) -codec copy $@

######################################################################

### Example ony!

Foundations1.mp4: dl/Foundations17.mp4
	ffmpeg -y -i $< -ss 5 -to 16 -acodec copy $@

Foundations2.mp4: dl/Foundations17.mp4
	ffmpeg -y -i $< -ss 222 -to 233 -acodec copy $@

Foundations_comb.mp4: Foundations_comb.txt Foundations1.mp4 Foundations2.mp4
	ffmpeg -f concat -i $< -codec copy $@

## Does not work (first file only)
Foundations_new.mp4: Foundations1.mp4 Foundations2.mp4
	ffmpeg -i "concat:Foundations1.mp4|Foundations2.mp4" -c:a copy -c:v copy $@

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
