.PHONY: set preprocess process clean

IN=in.txt

GT:=$(wildcard data/patient_*/ground_truth.nii.gz)
PNG:=$(GT:data/patient_%/ground_truth.nii.gz=preprocess/patient_%/ground_truth.png)

set: requirements.txt ~/.config/sxiv/exec/key-handler
	/usr/bin/env python -m pip install -r $<

~/.config/sxiv/exec/key-handler: key-handler
	mkdir -p $(@D)
	cp $< $@

preprocess: $(IN) $(PNG)

$(IN): $(PNG)
	echo $(PNG) | tr ' ' '\n' > $@

preprocess/patient_%/ground_truth.png: data/patient_%/ground_truth.nii.gz
	mkdir -p $(@D)
	python preprocess.py --input $< --output $@

process:
	sxiv -t $(shell cat $(IN))

clean:
	rm -rf preprocess/ $(IN) out.txt
